import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:plant_care_ut/core/utils/styles.dart';
import 'package:plant_care_ut/features/auth/presentation/views/sign_in_view.dart';
import 'package:plant_care_ut/features/auth/presentation/views/widgets/auth_custom_button.dart';
import 'package:plant_care_ut/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:plant_care_ut/features/home/presentation/views/home_view.dart';
import 'package:plant_care_ut/features/select_your_crop/presentation/views/select_your_crop_view.dart';
import 'package:plant_care_ut/generated/assets.dart';
import 'package:plant_care_ut/helper/show_snack_bar.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool isObscureText = true;

  String? name;
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
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
                  const SizedBox(
                    height: 57,
                  ),
                  Center(
                    child: Image.asset(
                      Assets.imagesLogo,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Title
                  Center(
                    child: Text('التسجيل',
                        style:
                            Styles.styleBold36.copyWith(color: Colors.white)),
                  ),
                  const SizedBox(height: 40),

                  // Label and Name TextField
                  Text(
                    'الاسم',
                    style: Styles.styleMedium20.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                  CustomTextFormField(
                    onChanged: (data) {
                      name = data;
                    },
                    hint: 'الاسم',
                    icon: Assets.imagesProfilepng,
                    passwordField: false,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'البريد الالكتروني',
                    style: Styles.styleMedium20.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                  CustomTextFormField(
                    onChanged: (data) {
                      email = data;
                    },
                    hint: 'البريد الالكتروني',
                    icon: Assets.imagesSms,
                    passwordField: false,
                  ),
                  const SizedBox(height: 32),

                  // Label and Password TextField
                  Text(
                    'كلمه السر',
                    style: Styles.styleMedium20.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                  CustomTextFormField(
                    onChanged: (data) {
                      password = data;
                    },
                    hint: ' كلمه السر',
                    icon: Assets.imagesLock,
                    passwordField: true,
                  ),
                  const SizedBox(height: 70),
                  AuthCustomButton(
                    text: 'تسجيل',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await registerUser();
                          showSnackBar(context, 'Email created successfully');
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SelectYourCropView()));
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'weak-password') {
                            showSnackBar(context, 'weak password');
                          } else if (ex.code == 'email-already-in-use') {
                            showSnackBar(context, 'email already in exists');
                          }
                        } catch (ex) {
                          showSnackBar(
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
                          'لدي حساب بالفعل ?',
                          style: Styles.styleSemiBoldLeagueSpartan16
                              .copyWith(color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignInView()));
                          },
                          icon: Text(
                            'تسجيل الدخول',
                            style: Styles.styleBoldLeagueSpartan16
                                .copyWith(color: const Color(0xFF43A047)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  Future<void> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
