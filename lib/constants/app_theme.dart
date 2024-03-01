import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store_app/constants/app_colors.dart';

abstract class AppTheme {
  static ThemeData themeData(
      {required bool isDarkTheme, required BuildContext context}) {
    return ThemeData(
      scaffoldBackgroundColor:
          isDarkTheme ? AppColors.darkCardColor : AppColors.lightScafoldColor,
      cardColor:
          isDarkTheme ? AppColors.darkCardColor : AppColors.lightCardColor,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
    );
  }
}
