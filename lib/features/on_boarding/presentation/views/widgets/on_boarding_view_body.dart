import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_care_ut/constants.dart';
import 'package:plant_care_ut/core/utils/styles.dart';
import 'package:plant_care_ut/core/widgets/custom_button.dart';
import 'package:plant_care_ut/features/auth/presentation/views/sign_in_view.dart';
import 'package:plant_care_ut/features/auth/presentation/views/sign_up_view.dart';
import 'package:plant_care_ut/features/on_boarding/presentation/views/widgets/on_boarding_page_indicator.dart';
import 'package:plant_care_ut/generated/l10n.dart';

import '../../../../../generated/assets.dart';
import '../../../../home/presentation/views/home_view.dart';
import '../../../data/models/on_boarding_info_model.dart';
import '../../manager/settings_cubit.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody(
      {super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    List<OnBoardingInfoModel> controller = [

      OnBoardingInfoModel(image: Assets.imagesOnBoarding1,title: S.of(context).First_pic),
      OnBoardingInfoModel(image: Assets.imagesOnBoarding2,title: S.of(context).sec_pic),
      OnBoardingInfoModel(image: Assets.imagesOnBoarding3,title: S.of(context).third_pic),
      OnBoardingInfoModel(image: Assets.imagesOnBoarding4,title: S.of(context).fourth_pic),
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 400,
          child: PageView.builder(
              itemCount: controller.length,
              controller: pageController,
              itemBuilder: (context, index) {
              return Column(
                  children: [
                    Image.asset(controller[index].image),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(controller[index].title,style: Styles.styleBold24.copyWith(color: Colors.white),)
                  ],
                );
              }),
        ),
        const SizedBox(
          height: 50,
        ),
        OnBoardingPageIndicator(
            pageController: pageController, controller: controller),
        const SizedBox(height: 61.43,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              CustomButton1(
                  backgroundColor: kPrimaryColor,
                  buttonWidth: 136.01,
                  buttonHeight: 47.67,
                  text: S.of(context).nextInBoarding,
                  onPressed: () {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                    if(controller.length==4){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SignUpView()));

                    }
                  }),
              const Spacer(),

              CustomButton1(
                  backgroundColor: const Color(0xFF171717),
                  text: S.of(context).skipInBoarding,
                  textColor: Colors.white,
                  buttonWidth: 136.01,
                  buttonHeight: 47.67,

                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SignUpView()));
                  }),

            ],
          ),
        )
      ],
    );

  }
  Widget _buildLanguageButton(BuildContext context, String language,
      Locale locale, Locale currentLocale) {
    bool isSelected = locale == currentLocale;
    return OutlinedButton(

      onPressed: () {
        context.read<SettingsCubit>().changeLocale(locale);
        // _restartApp(context); // Use SettingsCubit to change locale
      },
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(150,50),
        side: BorderSide(
            color: isSelected ? kPrimaryColor : const Color(0xFFD8D8D8)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      child: Text(
        language,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: 'Lato',
          color: isSelected ? kPrimaryColor : const Color(0xFFD8D8D8),
        ),
      ),
    );
  }
}
