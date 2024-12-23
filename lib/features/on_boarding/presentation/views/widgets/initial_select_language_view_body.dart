import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_care_ut/core/widgets/custom_button.dart';
import 'package:plant_care_ut/features/on_boarding/presentation/manager/settings_cubit.dart';
import 'package:plant_care_ut/features/on_boarding/presentation/views/on_boarding_view.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../generated/l10n.dart';

class InitialSelectLanguageViewBody extends StatelessWidget {
  const InitialSelectLanguageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        Locale currentLocale = const Locale('en'); // Default to English

        if (state is LocaleChanged) {
          currentLocale = state.locale;
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              S.of(context).lang,style: Styles.styleBoldLeagueSpartan28.copyWith(fontSize: 40,color: Colors.white),
              // "Select Your Language",
              textAlign: TextAlign.center,

            ),
            const SizedBox(
              height:100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Center(
                child: Column(
                  children: [
                    _buildLanguageButton(context, 'English',
                        const Locale('en'), currentLocale),
                    const SizedBox(height: 20,),
                    _buildLanguageButton(context, 'العربية',
                        const Locale('ar'), currentLocale),

                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: CustomButton1(
                      backgroundColor: kPrimaryColor,
                      buttonWidth: 136.01,
                      buttonHeight: 47.67,
                      text: S.of(context).nextInBoarding,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const OnBoardingView()));

                      }),
                ),
                const Spacer(),
                Container(),
              ],
            ),
            const SizedBox(height: 100,),


          ],
        );
      },
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
          fontWeight: FontWeight.w900,
          fontFamily: 'Lato',
          color: isSelected ? const Color(0xFF8FAB11) : const Color(0xFFD8D8D8),
        ),
      ),
    );
  }
}
