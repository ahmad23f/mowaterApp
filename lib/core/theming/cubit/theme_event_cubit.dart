import 'package:Mowater/core/constants/color.dart';
import 'package:Mowater/core/theme/theming/theme_service.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'theme_event_state.dart';

class ThemeCubit extends Cubit<ThemeEventState> {
  final LanguageCubit _languageCubit;

  ThemeCubit(this._languageCubit) : super(const ThemeEventState.initial());

  void toggleTheme() {
    emit(state.when(
      initial: () => ThemeEventState.themeChanged(lightMode),
      themeChanged: (theme) {
        if (theme == lightMode) {
          print('should be faluse ');
          ThemeService.changeTheme(true);
          return ThemeEventState.themeChanged(darkMode);
        } else {
          print('should be true ');

          ThemeService.changeTheme(false);

          return ThemeEventState.themeChanged(lightMode);
        }
      },
    ));
  }

  void toggleLanguage(BuildContext context) {
    _languageCubit.toggleLanguage(context);
  }
}

class ColorApp {
  static const Color primeryColorLight = Color(0xFFEF5350); // Red
  static const Color secunderyColorLight =
      Color.fromARGB(255, 155, 155, 155); // Blue

  static const Color primeryColorDark = Color(0xFFB71C1C); // Darker Red
  static const Color secunderyColorDark =
      Color.fromARGB(255, 67, 67, 67); // Darker Blue
}

final ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: ColorApp.primeryColorDark,
    secondary: Color.fromARGB(255, 137, 137, 137),
  ),
);

final ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: ColorApp.primeryColorLight,
    secondary: Color.fromARGB(255, 166, 166, 167),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(color: Colors.black87),
    titleTextStyle: TextStyle(color: Colors.black87), // Adjust text color
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.black87),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: ColorApp.primeryColorLight,
    foregroundColor: Colors.white,
  ),
);

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en', 'US'));

  void toggleLanguage(BuildContext context) {
    emit(state == const Locale('ar', 'AE')
        ? const Locale('en', 'US')
        : const Locale('ar', 'AE'));
    // Notify EasyLocalization about the language change
    EasyLocalization.of(context)?.setLocale(state);
  }
}
