import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppMenuCategoryCount extends StatelessWidget {
  const AppMenuCategoryCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sandwiches',
            style: TextStyle(
              fontSize: 24.r,
              fontFamily: 'SpecialGothicCondensedOne',
              color: AppColors.body900,
            ),
          ),
          SizedBox(width: 4.w),
          Transform.translate(
            offset: Offset(0, 2.h),
            child: Text(
              '(12 Items)',
              style: TextStyle(
                fontSize: 16.r,
                fontFamily: 'SpecialGothicCondensedOne',
                color: AppColors.body700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
