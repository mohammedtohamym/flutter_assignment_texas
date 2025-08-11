import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_assets.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/core/resources/app_fonts.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/cubit/profile_states.dart';
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
  height: 190,
      width: double.infinity,
  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
      padding: EdgeInsets.only(
  left: 16,
  right: 10,
  top: 16,
  bottom: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.body25,
  borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: AppColors.body900.withValues(alpha: 0.16),
            blurRadius: 4,
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
                    radius: 32,
                    backgroundColor: AppColors.body300,
                    child: profileData.imagePath != null
                        ? Image.network(profileData.imagePath!)
                        : Text(
                             profileData.name[0],
                            style: TextStyle(
                              color: AppColors.body900,
                              fontFamily:
                                  AppFonts.getSpecialGothicCondensedOne(),
                              fontSize: 24,
                            ),
                          ),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profileData.name ,
                        style: TextStyle(
                          color: AppColors.body900,
                          fontFamily: AppFonts.getSpecialGothicCondensedOne(),
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          SvgPicture.asset(
                            profileData.countryIcon,
                            height: 33,
                          ),
                          SizedBox(width: 4),
                          Text(
                            profileData.phone,
                            style: TextStyle(
                              color: AppColors.body900,
                              fontFamily:
                                  AppFonts.getSpecialGothicCondensedOne(),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        profileData.email,
                        style: TextStyle(
                          color: AppColors.body700,
                          fontFamily: AppFonts.getSpecialGothicCondensedOne(),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12),
              Center(
                child: ElevatedButton(
                  onPressed: onUpdateProfile,
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    minimumSize: Size(320, 40),
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        4,
                      ), // Change border radius here
                    ),
                    backgroundColor: AppColors.primaryOrange,
                  ),
                  child: Text(
                    'Update Profile',
                    style: TextStyle(
                      fontSize: 20,
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
                      radius: 12,
                      child: SvgPicture.asset(
                        AppAssets.logoutIcon,
                        colorFilter: ColorFilter.mode(
                          AppColors.body25,
                          BlendMode.srcIn,
                        ),
                        height: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 4),
                Text(
                  'Logout',
                  style: TextStyle(
                    color: AppColors.body700,
                    fontFamily: AppFonts.getSpecialGothicCondensedOne(),
                    fontSize: 18,
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
