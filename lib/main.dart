import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plant_care_ut/features/chatbot/presentation/manager/chat_cubit.dart';
import 'core/local/cache_helper.dart';
import 'features/auth/presentation/views/sign_in_view.dart';
import 'features/on_boarding/presentation/manager/settings_cubit.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CacheHelper.init();

  // runApp(
  //   DevicePreview(
  //     enabled: true,
  //     builder: (context) => const PlantCareUt(),
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
                  iconTheme: const IconThemeData(color: Colors.white),
                  appBarTheme: const AppBarTheme(
                    iconTheme: IconThemeData(color: Colors.white),
                    color: Color(0xFF171717),
                  ),
                  scaffoldBackgroundColor: const Color(0xFF171717)),
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
