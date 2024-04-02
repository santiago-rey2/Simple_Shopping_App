import 'package:flutter/material.dart';
import 'package:simple_shopping/settings/colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData defaultTheme = ThemeData(
      primaryColor: AppColors.brandPrimaryColor,
      scaffoldBackgroundColor: AppColors.brandSecondaryColor,
      iconTheme: const IconThemeData(color: Colors.black));
}
