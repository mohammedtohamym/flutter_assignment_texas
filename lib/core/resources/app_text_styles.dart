import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/core/resources/app_fonts.dart';

class AppTextStyles {
  // Headings
  static TextStyle get h1Bernier => TextStyle(
    fontFamily: AppFonts.getBernier(),
    fontSize: 22,
    color: AppColors.body900,
  );

  static TextStyle get h2Bernier => TextStyle(
    fontFamily: AppFonts.getBernier(),
    fontSize: 21,
    color: AppColors.body900,
  );

  // Body
  static TextStyle get body => TextStyle(
    fontFamily: AppFonts.getSpecialGothicCondensedOne(),
    fontSize: 18,
    color: AppColors.body900,
  );

  static TextStyle get bodySmall => TextStyle(
    fontFamily: AppFonts.getSpecialGothicCondensedOne(),
    fontSize: 16,
    color: AppColors.body900,
  );

  static TextStyle get bodyMuted => TextStyle(
    fontFamily: AppFonts.getSpecialGothicCondensedOne(),
    fontSize: 16,
    color: AppColors.body700,
  );

  static TextStyle get bodyMutedSm => TextStyle(
    fontFamily: AppFonts.getSpecialGothicCondensedOne(),
    fontSize: 14,
    color: AppColors.body700,
  );

  static TextStyle get labelSm => TextStyle(
    fontFamily: AppFonts.getSpecialGothicCondensedOne(),
    fontSize: 12,
    color: AppColors.body900,
  );

  static TextStyle get label => TextStyle(
    fontFamily: AppFonts.getSpecialGothicCondensedOne(),
    fontSize: 14,
    color: AppColors.body900,
  );

  static TextStyle get labelSelected => TextStyle(
    fontFamily: AppFonts.getSpecialGothicCondensedOne(),
    fontSize: 14,
    color: AppColors.body900,
  );

  static TextStyle get button => TextStyle(
    fontFamily: AppFonts.getSpecialGothicCondensedOne(),
    fontSize: 20,
    color: AppColors.body900,
  );

  static TextStyle get buttonSmall => TextStyle(
    fontFamily: AppFonts.getSpecialGothicCondensedOne(),
    fontSize: 18,
    color: AppColors.secondaryRed,
  );

  static TextStyle price({bool muted = false}) => TextStyle(
    fontFamily: AppFonts.getSpecialGothicCondensedOne(),
    fontSize: muted ? 18 : 20,
    color: muted ? AppColors.body700 : Colors.black,
    decoration: muted ? TextDecoration.lineThrough : TextDecoration.none,
    decorationColor: muted ? AppColors.body700 : null,
    decorationThickness: muted ? 0.8 : null,
  );
}
