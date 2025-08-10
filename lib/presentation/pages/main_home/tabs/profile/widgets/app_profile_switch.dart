import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/core/resources/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppProfileSwitch extends StatelessWidget {
  final String mainText;
  final String secondaryText;
  final String icon;
  final bool isSwitched;
  const AppProfileSwitch({
    super.key,
    required this.mainText,
    required this.icon,
    required this.secondaryText,
    this.isSwitched = false,
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
              Container(
                height: 56.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      icon,
                      colorFilter: ColorFilter.mode(
                        AppColors.body900,
                        BlendMode.srcIn,
                      ),
                      height: 18.h,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mainText,
                      style: TextStyle(
                        color: AppColors.body900,
                        fontFamily: AppFonts.getSpecialGothicCondensedOne(),
                        fontSize: 20.r,
                      ),
                    ),
                    Text(
                      secondaryText,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.body700,
                        fontFamily: AppFonts.getSpecialGothicCondensedOne(),
                        fontSize: 16.r,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              Switch(
                value: !isSwitched,
                onChanged: (value) {},
                activeTrackColor: AppColors.body900, // Track color when ON
                activeColor: AppColors.body300, // Thumb color when OFF
                inactiveThumbColor:
                    AppColors.primaryOrange, // Thumb color when ON
                inactiveTrackColor: AppColors.body900, // Track color when OFF
                thumbIcon: WidgetStateProperty.resolveWith<Icon?>((states) {
                  if (states.contains(WidgetState.selected)) {
                    return Icon(
                      Icons.check,
                      color: AppColors.body900,
                    ); // Icon when ON
                  }
                  return Icon(
                    Icons.check,
                    color: AppColors.body700,
                  ); // Icon when OFF
                }),
              ),
              SizedBox(width: 24.w),
            ],
          ),
          SizedBox(height: 8.h),
          Divider(
            color: AppColors.body900.withValues(alpha: 0.05.r),
            thickness: 1.r,
            indent: 24.w,
            endIndent: 24.w,
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
