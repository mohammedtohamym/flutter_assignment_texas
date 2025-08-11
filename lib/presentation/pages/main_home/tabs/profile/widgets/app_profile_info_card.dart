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
      width: 408,
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.only(left: 15, right: 10, top: 20, bottom: 21),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.13),
            blurRadius: 8.73,
            offset: Offset(0, 0.97),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                              fontSize: 31,
                            ),
                          ),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profileData.name,
                        style: TextStyle(
                          color: AppColors.body900,
                          fontFamily: AppFonts.getSpecialGothicCondensedOne(),
                          fontSize: 18,
                        ),
                      ),
                      // SizedBox(height: 4),
                      Row(
                        children: [
                          SvgPicture.asset(profileData.countryIcon, height: 33),
                          SizedBox(width: 10),
                          Text(
                            profileData.phone,
                            style: TextStyle(
                              color: AppColors.body900,
                              fontFamily:
                                  AppFonts.getSpecialGothicCondensedOne(),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
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
              SizedBox(height: 24),
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
                      fontSize: 17,
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
            child: Transform.translate(
              offset: Offset(0, -10),
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
                            AppColors.white,
                            BlendMode.srcIn,
                          ),
                          height: 12,
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
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
