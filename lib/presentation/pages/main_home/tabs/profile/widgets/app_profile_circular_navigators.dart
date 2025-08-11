import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_assignment_texas/core/resources/app_text_styles.dart';

class AppProfileCircularNavigators extends StatelessWidget {
  final String title;
  final String? imagePath;
  final VoidCallback? onTap;

  const AppProfileCircularNavigators({
    super.key,
    required this.title,
    this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primaryOrange.withValues(alpha: 0.07),
            radius: 41,
            child: imagePath != null
                ? SvgPicture.asset(
                    imagePath!,
                    fit: BoxFit.cover,
                    width: 55,
                    height: 57,
                  )
                : Icon(Icons.favorite, color: AppColors.white, size: 16),
          ),
          SizedBox(height: 4),
      Text(title,
        style: AppTextStyles.body
          .copyWith(color: AppColors.body900, fontSize: 18)),
        ],
      ),
    );
  }
}
