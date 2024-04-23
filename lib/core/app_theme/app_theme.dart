import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

ThemeData getAppTheme(BuildContext context) => ThemeData(
      // fontFamily: context.locale == AppLocale.english ? AppFontFamilies.inter : AppFontFamilies.cairo,
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.white, centerTitle: true),
      brightness: Brightness.light,
      primaryColor: AppColors.primary.shade600,
      // colorScheme: const ColorScheme.light(primary: Colors.white),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColors.primary.shade600),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary.shade600,
        foregroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
      ),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: AppColors.primary.shade600),
        iconColor: AppColors.text.shade400,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary.shade600, width: 1.5),
          borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.borderShade75),
          borderRadius: BorderRadius.circular(4),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.text, fontSize: 13),
        bodyMedium: TextStyle(color: AppColors.text, fontSize: 13),
      ),
    );
