import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_assets.dart';

import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/widgets/app_profile_circular_navigators.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/widgets/app_profile_info_card.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/widgets/app_profile_notification_tile.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/widgets/app_profile_switch.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/widgets/app_profile_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  //todo : implement notification count logic
  //todo : implement switch count logic

  //todo : change all strings

  final int count = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.body25,

      child: Column(
        children: [
          SizedBox(height: 16.h),
          SafeArea(
            child: Row(
              children: [
                SizedBox(width: 16.w),
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: AppColors.body100,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.body900,
                      size: 24.r,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(width: 16.w),
                Text(
                  'PROFILE',
                  style: TextStyle(
                    color: AppColors.body900,
                    fontSize: 22.r,
                    fontFamily: 'BERNIER',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(height: 6.h, color: AppColors.body100),
                  AppProfileInfoCard(),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AppProfileCircularNavigators(
                        title: 'Favorites',
                        imagePath: AppAssets.favoritesIcon,
                      ),
                      AppProfileCircularNavigators(
                        title: 'Rewards',
                        imagePath: AppAssets.awardsIcon,
                      ),
                      AppProfileCircularNavigators(
                        title: 'Orders',
                        imagePath: AppAssets.ordersIcon,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Container(height: 12.h, color: AppColors.body200),
                  SizedBox(height: 16.h),
                  AppProfileTile(
                    text: 'My Addresses',
                    icon: AppAssets.addressIcon,
                  ),
                  AppProfileTile(
                    text: 'Change Password',
                    icon: AppAssets.passwordIcon,
                  ),
                  AppProfileTile(text: 'Offers', icon: AppAssets.offersIcon),
                  AppProfileTile(text: 'Deals', icon: AppAssets.dealsIcon),
                  AppProfileNotificationTile(
                    text: 'Notifications',
                    icon: AppAssets.notificationsIcon,
                    count: count,
                  ),
                  AppProfileTile(
                    text: 'Delete my Account',
                    icon: AppAssets.deleteAccountIcon,
                    hasSuffixIcon: false,
                    textColor: AppColors.secondaryRed,
                    hasDivider: false,
                  ),
                  Container(height: 12.h, color: AppColors.body300),
                  SizedBox(height: 16.h),
                  AppProfileSwitch(
                    mainText: 'Marketing Communication',
                    icon: AppAssets.marketingIcon,
                    secondaryText:
                        'once you open it you will receive emails and offers on your inbox',
                  ),
                  AppProfileSwitch(
                    isSwitched: true,
                    mainText: 'App Communication',
                    icon: AppAssets.communicationIcon,
                    secondaryText:
                        'Once you open it you will receive notifications from our app',
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
