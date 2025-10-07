import 'package:flutter/material.dart';
import 'package:musicappflutter/themes/light_mode.dart';
import 'package:musicappflutter/themes/dark_mode.dart';

class ThemeProvider extends ChangeNotifier {
  //initially set to light mode
  ThemeData _themeData = lightMode;

  //get theme
  ThemeData get themeData => _themeData;

  //is dark mode
  bool get isDarkMode => _themeData == darkMode;

  //set theme
  set themeData(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  //toggle theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      _themeData = darkMode;
    } else {
      _themeData = lightMode;
    }
    notifyListeners();
  }
}