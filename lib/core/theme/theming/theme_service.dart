import 'package:hive_flutter/hive_flutter.dart';

class ThemeService {
  static changeTheme(bool isDarkMode) async {
    final themeBox = Hive.box('theme');
    print(isDarkMode);
    themeBox.put('themeMode', isDarkMode);
  }

  static bool getThemeMode() {
    final themeBox = Hive.box('theme');

    final response = themeBox.get('themeMode', defaultValue: false);
    print(response);
    return response;
  }
}
