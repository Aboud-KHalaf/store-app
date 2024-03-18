import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  // ignore: constant_identifier_names
  static const THEME_KEY = "theme_key";
  bool darkTheme = false;
  bool get isDarkTheme => darkTheme;

  ThemeProvider() {
    getDarkTheme();
  }

  Future<void> setDarkTheme({required bool isDarkTheme}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(THEME_KEY, isDarkTheme);
    darkTheme = isDarkTheme;
    notifyListeners();
  }

  Future<void> getDarkTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    darkTheme = sharedPreferences.getBool(THEME_KEY) ?? false;
    notifyListeners();
  }
}
