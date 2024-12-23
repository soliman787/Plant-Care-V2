import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plant_care_ut/constants.dart';
import 'package:plant_care_ut/features/auth/presentation/views/sign_up_view.dart';
import 'package:plant_care_ut/features/chatbot/presentation/manager/chat_cubit.dart';
import 'package:plant_care_ut/features/chatbot/presentation/views/chat_view.dart';
import 'package:plant_care_ut/features/home/presentation/views/home_view.dart';
import 'package:plant_care_ut/features/on_boarding/presentation/views/on_boarding_view.dart';

import 'core/local/cache_helper.dart';
import 'features/account/presentation/manager/views/widgets/account_view_body.dart';
import 'features/auth/presentation/views/sign_in_view.dart';
import 'features/chatbot/presentation/views/chatbot_view.dart';
import 'features/home/presentation/views/new_home_view.dart';
import 'features/on_boarding/presentation/manager/settings_cubit.dart';
import 'features/on_boarding/presentation/views/initial_select_language_view.dart';
import 'features/results/presentation/views/results_view.dart';
import 'features/select_your_crop/presentation/views/select_your_crop_view.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  await CacheHelper.init();
  //
  // runApp(
  //   DevicePreview(
  //     enabled: true,
  //     builder: (context) => const PlantCare(),
  //   ),
  // );
  runApp(
    const PlantCareUt(),
  );
}

class PlantCareUt extends StatelessWidget {
  const PlantCareUt({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => SettingsCubit(),
        ),
        BlocProvider(
          create: (ctx) => ChatCubit(),
        ),

      ],
      child: Builder(builder: (BuildContext context) {
        return BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            Locale locale = context.watch<SettingsCubit>().locale;
            if (state is LocaleChanged) {
              locale = state.locale;
            }
            return MaterialApp(
              color: const Color(0xFF171717),
              theme: ThemeData(

                  iconTheme: const IconThemeData(
                      color: Colors.white
                  ),
                  appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(
                        color: Colors.white
                    ),
                    color: Color(0xFF171717),
                  ),
                  scaffoldBackgroundColor: const Color(0xFF171717)
              ),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              locale: locale,
              home: const SignInView(),
            );
          },
        );
      }),
    );
  }
}
