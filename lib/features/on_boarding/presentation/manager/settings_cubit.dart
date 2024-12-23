import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../core/local/cache_helper.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial()) {
    _loadLocale();
  }

  Locale _locale = const Locale('en');

  // Method to get the current locale
  Locale get locale => _locale;

  void _loadLocale() async {

    final String? languageCode = await CacheHelper.getData(key: CacheHelper.languageCode);
    if (languageCode == null) {
      // If no languageCode is stored, set it to the default value 'en'
      await CacheHelper.saveData(key: CacheHelper.languageCode, value: 'en');
      _locale = const Locale('en');
    } else {
      _locale = Locale(languageCode);
    }
    emit(LocaleChanged(_locale));
  }


  void changeLocale(Locale newLocale) async {
    if (_locale != newLocale) {
      _locale = newLocale;
      await CacheHelper.saveData(
          key: CacheHelper.languageCode, value: newLocale.languageCode);
      emit(LocaleChanged(_locale));
    }
  }
}
