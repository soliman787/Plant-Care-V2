part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class LocaleChanged extends SettingsState {
  final Locale locale;

  LocaleChanged(this.locale);
}
