import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:plant_care_ut/core/utils/styles.dart';
import 'package:plant_care_ut/features/auth/presentation/views/sign_up_view.dart';
import 'package:plant_care_ut/features/auth/presentation/views/widgets/auth_custom_button.dart';
import 'package:plant_care_ut/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:plant_care_ut/features/home/presentation/views/home_view.dart';
import 'package:plant_care_ut/generated/assets.dart';
import 'package:plant_care_ut/helper/show_snack_bar.dart';

import '../../../../home/presentation/views/new_home_view.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  bool isObscureText = true;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  String? email;

  String? password;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return ModalProgressHUD(

      inAsyncCall: isLoading,
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(
                    height: height >1136 ?130:50,
                  ),
                  Center(
                    child: Image.asset(
                      Assets.imagesLogo, // Replace with your logo asset
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      'تسجيل الدخول',
                      style: Styles.styleBold36.copyWith(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'البريد الالكتروني',
                    style: Styles.styleMedium20.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                  CustomTextFormField(
                    hint: 'البريد الالكتروني',
                    icon: Assets.imagesSms,
                    passwordField: false,
                    onChanged: (data) {
                      email = data;
                    },
                  ),
                  const SizedBox(height: 30),

                  // Label and Password TextField
                  Text(
                    'كلمه السر',
                    style: Styles.styleMedium20.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    onChanged: (data) {
                      password = data;
                    },
                    hint: 'كلمه السر',
                    passwordField: true,
                    icon: Assets.imagesLock,
                  ),
                  const SizedBox(height: 50),

                  AuthCustomButton(
                    text: 'تسجيل الدخول',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await loginUser();
                          showErrorSnackBar(context, 'Login successfully');
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NewHomeView()));
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'user-not-found') {
                            setState(() {
                              showErrorSnackBar(context, 'User not found');

                            });
                          } else if (ex.code == 'wrong-password') {
                            setState(() {
                              showSnackBar(context, 'Wrong password entered');

                            });
                          }
                        } catch (ex) {
                          print(ex);
                          showErrorSnackBar(
                              context, 'There was an error , Please try again');
                        }
                        isLoading = false;
                        setState(() {});
                      } else {}
                    },
                  ),
                  const SizedBox(height: 16),

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ليس لدي حساب !',
                          style: Styles.styleSemiBoldLeagueSpartan16
                              .copyWith(color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignUpView()));
                          },
                          icon: Text(
                            'تسجيل',
                            style: Styles.styleBoldLeagueSpartan16
                                .copyWith(color: const Color(0xFF43A047)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
