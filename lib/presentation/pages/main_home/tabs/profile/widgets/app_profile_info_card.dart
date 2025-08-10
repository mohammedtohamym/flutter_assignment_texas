import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_assets.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/core/resources/app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppProfileInfoCard extends StatelessWidget {
  //todo: make a model for user profile information and use mock data, for now it uses hardcoded values in design

  //todo: change all strings to localized strings

  final String? name;
  final String? phone;
  final String? email;
  final String? imgPath;
  final IconData? country;
  const AppProfileInfoCard({
    super.key,
    this.name,
    this.phone,
    this.email,
    this.imgPath,
    this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 18.h),
      padding: EdgeInsets.only(
        left: 16.w,
        right: 10.w,
        top: 16.h,
        bottom: 16.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.body25,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.body900.withValues(alpha: 0.2),
            blurRadius: 4.r,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 32.r,
                    backgroundColor: AppColors.body300,
                    child: imgPath != null
                        ? Image.network(imgPath!)
                        : Text(
                            'A',
                            style: TextStyle(
                              color: AppColors.body900,
                              fontFamily:
                                  AppFonts.getSpecialGothicCondensedOne(),
                              fontSize: 24.r,
                            ),
                          ),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name ?? 'Ahmed Magdy',
                        style: TextStyle(
                          color: AppColors.body900,
                          fontFamily: AppFonts.getSpecialGothicCondensedOne(),
                          fontSize: 20.r,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          country != null
                              ? Icon(
                                  country!,
                                  color: AppColors.body700,
                                  size: 24.r,
                                )
                              : SvgPicture.asset(
                                  AppAssets.egyptFlagIcon,
                                  height: 33.r,
                                ),
                          SizedBox(width: 4.w),
                          Text(
                            '012-000-00-663',
                            style: TextStyle(
                              color: AppColors.body900,
                              fontFamily:
                                  AppFonts.getSpecialGothicCondensedOne(),
                              fontSize: 20.r,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'ahmed@paradigmegypt.com',
                        style: TextStyle(
                          color: AppColors.body700,
                          fontFamily: AppFonts.getSpecialGothicCondensedOne(),
                          fontSize: 18.r,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle add to cart action
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0.r,
                    minimumSize: Size(320.w, 40.h),
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        4.r,
                      ), // Change border radius here
                    ),
                    backgroundColor: AppColors.primaryOrange,
                  ),
                  child: Text(
                    'Update Profile',
                    style: TextStyle(
                      fontSize: 20.r,
                      fontFamily: AppFonts.getSpecialGothicCondensedOne(),
                      color: AppColors.body900,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.secondaryRed,
                    radius: 12.r,
                    child: SvgPicture.asset(
                      AppAssets.logoutIcon,
                      colorFilter: ColorFilter.mode(
                        AppColors.body25,
                        BlendMode.srcIn,
                      ),
                      height: 16.h,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 4.w),
              Text(
                'Logout',
                style: TextStyle(
                  color: AppColors.body700,
                  fontFamily: AppFonts.getSpecialGothicCondensedOne(),
                  fontSize: 18.r,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
