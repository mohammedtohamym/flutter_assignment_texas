import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_assets.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/core/resources/app_fonts.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/cubit/profile_states.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppProfileInfoCard extends StatelessWidget {
  final ProfileData profileData;
  final VoidCallback? onUpdateProfile;
  final VoidCallback? onLogout;

  const AppProfileInfoCard({
    super.key,
    required this.profileData,
    this.onUpdateProfile,
    this.onLogout,
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
        borderRadius: BorderRadius.circular(4.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.body900.withValues(alpha: 0.16),
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
                    child: profileData.imagePath != null
                        ? Image.network(profileData.imagePath!)
                        : Text(
                             profileData.name[0],
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
                        profileData.name ,
                        style: TextStyle(
                          color: AppColors.body900,
                          fontFamily: AppFonts.getSpecialGothicCondensedOne(),
                          fontSize: 20.r,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          SvgPicture.asset(
                            profileData.countryIcon,
                            height: 33.r,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            profileData.phone,
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
                        profileData.email,
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
                  onPressed: onUpdateProfile,
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
          GestureDetector(
            onTap: onLogout,
            child: Row(
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
          ),
        ],
      ),
    );
  }
}
