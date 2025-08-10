import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/cubit/profile_cubit.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/cubit/profile_states.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/widgets/app_profile_circular_navigators.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/widgets/app_profile_info_card.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/widgets/app_profile_notification_tile.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/widgets/app_profile_switch.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/widgets/app_profile_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // Show error snackbar
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!),
                backgroundColor: AppColors.secondaryRed,
                action: SnackBarAction(
                  label: 'Dismiss',
                  textColor: AppColors.body25,
                  onPressed: () {
                    context.read<ProfileCubit>().clearError();
                  },
                ),
              ),
            );
          }

          // Show success snackbar
          if (state.successMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.successMessage!),
                backgroundColor: Colors.green,
                action: SnackBarAction(
                  label: 'Dismiss',
                  textColor: AppColors.body25,
                  onPressed: () {
                    context.read<ProfileCubit>().clearSuccessMessage();
                  },
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
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
                            onPressed: () {},
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
                  const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            );
          }

          final cubit = context.read<ProfileCubit>();
          final circularNavigators = cubit.getCircularNavigators();

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
                        Stack(
                          children: [
                            AppProfileInfoCard(
                              profileData: state.profileData,
                              onUpdateProfile: cubit.updateProfile,
                              onLogout: cubit.logout,
                            ),
                            if (state.isUpdatingProfile)
                              Positioned.fill(
                                child: Container(
                                  color: AppColors.body900.withValues(
                                    alpha: 0.3,
                                  ),
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: circularNavigators
                              .map(
                                (navigator) => AppProfileCircularNavigators(
                                  title: navigator.title,
                                  imagePath: navigator.imagePath,
                                  onTap: navigator.onTap,
                                ),
                              )
                              .toList(),
                        ),
                        SizedBox(height: 16.h),
                        Container(height: 12.h, color: AppColors.body200),
                        SizedBox(height: 16.h),
                        ...state.menuItems.map((item) {
                          if (item.text == 'Notifications' &&
                              item.count != null) {
                            return AppProfileNotificationTile(
                              text: item.text,
                              icon: item.icon,
                              textColor: item.textColor,
                              hasSuffixIcon: item.hasSuffixIcon,
                              hasDivider: item.hasDivider,
                              count: item.count!,
                              onTap: item.onTap,
                            );
                          }
                          return AppProfileTile(
                            text: item.text,
                            icon: item.icon,
                            textColor: item.textColor,
                            hasSuffixIcon: item.hasSuffixIcon,
                            hasDivider: item.hasDivider,
                            onTap: item.onTap,
                          );
                        }).toList(),
                        Container(height: 12.h, color: AppColors.body100),
                        SizedBox(height: 16.h),
                        ...state.switchItems
                            .map(
                              (item) => AppProfileSwitch(
                                mainText: item.mainText,
                                icon: item.icon,
                                secondaryText: item.secondaryText,
                                isSwitched: item.isEnabled,
                                onChanged: item.onChanged,
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
