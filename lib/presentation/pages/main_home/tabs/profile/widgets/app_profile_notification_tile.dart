import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppProfileNotificationTile extends StatelessWidget {
  final String text;
  final String icon;
  final Color? textColor;
  final bool hasSuffixIcon;
  final bool hasDivider;
  final int count;
  const AppProfileNotificationTile({
    super.key,
    required this.text,
    required this.icon,
    this.textColor,
    this.hasSuffixIcon = true,
    this.hasDivider = true,
    this.count = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.body25,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 24.w),
              Stack(
                children: [
                  SvgPicture.asset(
                    icon,
                    colorFilter: ColorFilter.mode(
                      textColor ?? AppColors.body900,
                      BlendMode.srcIn,
                    ),
                    height: 16.h,
                  ),
                  if (count > 0)
                    Transform.translate(
                      offset: Offset(8.w, -4.h),
                      child: CircleAvatar(
                        backgroundColor: AppColors.primaryOrange,
                        radius: 6.r,
                        child: Text(
                          '$count',
                          style: TextStyle(
                            color: AppColors.body25,
                            fontSize: 8.h,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(width: 8.w),
              Text(
                text,
                style: TextStyle(
                  color: textColor ?? AppColors.body900,
                  fontFamily: 'SpecialGothicCondensedOne',
                  fontSize: 18.r,
                ),
              ),
              Spacer(),
              hasSuffixIcon
                  ? Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.body900,
                      size: 12.r,
                    )
                  : SizedBox.shrink(),
              SizedBox(width: 24.w),
            ],
          ),
          SizedBox(height: 8.h),
          Divider(
            color: hasDivider
                ? AppColors.body900.withValues(alpha: 0.05.r)
                : Colors.transparent,
            thickness: 1.r,
            indent: 24.w,
            endIndent: 24.w,
          ),
          SizedBox(height: hasDivider ? 8.h : 0),
        ],
      ),
    );
  }
}
