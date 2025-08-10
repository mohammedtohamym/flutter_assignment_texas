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
  final Function(bool)? onChanged;

  const AppProfileSwitch({
    super.key,
    required this.mainText,
    required this.icon,
    required this.secondaryText,
    required this.isSwitched,
    this.onChanged,
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
                onChanged: (value) {
                  print(
                    'Switch tapped: $mainText, new value: $value, current: $isSwitched',
                  );
                  onChanged?.call(!value);
                },
                // Left is on and Right is off according to design
                activeTrackColor: AppColors.body900,
                activeColor: AppColors.body300,
                inactiveThumbColor: AppColors.primaryOrange,
                inactiveTrackColor: AppColors.body900,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                thumbIcon: WidgetStateProperty.resolveWith<Icon?>((states) {
                  if (states.contains(WidgetState.selected)) {
                    return Icon(
                      Icons.check,
                      color: AppColors.body900,
                      size: 12.r,
                    );
                  }

                  return Icon(
                    Icons.check,
                    color: AppColors.body900,
                    size: 12.r,
                  );
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
