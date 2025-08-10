import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppProfileCircularNavigators extends StatelessWidget {
  final String title;
  final String? imagePath;

  const AppProfileCircularNavigators({
    super.key,
    required this.title,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.primaryOrange,
          radius: 40.r,
          child: imagePath != null
              ? ClipOval(
                  child: SvgPicture.asset(
                    imagePath!,
                    fit: BoxFit.cover,
                    width: 80.r,
                    height: 80.r,
                  ),
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
    );
  }
}
