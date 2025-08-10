import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            radius: 40.r,
            child: imagePath != null
                ? SvgPicture.asset(
                    imagePath!,
                    fit: BoxFit.cover,
                    width: 52.r,
                    height: 52.r,
                  )
                : Icon(Icons.favorite, color: AppColors.body25, size: 16.r),
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            style: TextStyle(
              color: AppColors.body900,
              fontFamily: 'SpecialGothicCondensedOne',
              fontSize: 20.r,
            ),
          ),
        ],
      ),
    );
  }
}
