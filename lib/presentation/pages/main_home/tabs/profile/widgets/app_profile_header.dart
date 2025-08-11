import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/core/resources/app_text_styles.dart';

class AppProfileHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBack;
  final TextStyle? titleStyle;
  final double avatarRadius;
  final double iconSize;
  final double leftPadding;
  final double spacing;

  const AppProfileHeader({
    super.key,
    required this.title,
    required this.onBack,
    this.titleStyle,
    this.avatarRadius = 18,
    this.iconSize = 18,
    this.leftPadding = 16,
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          SizedBox(width: leftPadding),
          CircleAvatar(
            radius: avatarRadius,
            backgroundColor: AppColors.body100,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.body900,
                size: iconSize,
              ),
              onPressed: onBack,
            ),
          ),
          SizedBox(width: spacing),
          Text(
            title,
            style: titleStyle ?? AppTextStyles.h2Bernier,
          ),
        ],
      ),
    );
  }
}
