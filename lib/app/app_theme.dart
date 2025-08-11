import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/core/resources/app_fonts.dart';

ThemeData getAppTheme(BuildContext context) {
  return ThemeData(
    primaryColor: AppColors.primaryOrange,
    scaffoldBackgroundColor: Colors.white,
    splashColor: AppColors.primaryOrange.withValues(alpha: 0.1),
    highlightColor: AppColors.primaryOrange.withValues(alpha: 0.1),
    // app bar
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: AppColors.body900,
        fontFamily: AppFonts.getBernier(),
      ),
    ),

    // elevatedButton
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          AppColors.primaryOrange,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        foregroundColor: WidgetStateProperty.all<Color>(AppColors.body900),
        textStyle: WidgetStateProperty.all<TextStyle>(
          TextStyle(fontFamily: AppFonts.getSpecialGothicCondensedOne()),
        ),
      ),
    ),

    // Text Theme
    textTheme: Theme.of(context).textTheme.apply(
      bodyColor: AppColors.body900,
      fontFamily: AppFonts.getBernier(),
    ),
  );
}
