import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  bool isDarkMode = false;

  void changeTheme(bool value) {
    if (value) {
      currentTheme = ThemeMode.dark;
      isDarkMode = true;
    } else {
      currentTheme = ThemeMode.light;
      isDarkMode = false;
    }
    notifyListeners();
  }
}
