import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppProfileTile extends StatelessWidget {
  final String text;
  final String icon;
  final Color? textColor;
  final bool hasSuffixIcon;
  final bool hasDivider;
  final VoidCallback? onTap;
  
  const AppProfileTile({
    super.key,
    required this.text,
    required this.icon,
    this.textColor,
    this.hasSuffixIcon = true,
    this.hasDivider = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColors.body25,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 24.w),
                SvgPicture.asset(
                  icon,
                  colorFilter: ColorFilter.mode(
                    textColor ?? AppColors.body900,
                    BlendMode.srcIn,
                  ),
                  height: 20.h,
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
      ),
    );
  }
}
