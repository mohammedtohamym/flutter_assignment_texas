import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/core/resources/app_strings.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/cubit/profile_cubit.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/cubit/profile_states.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/widgets/app_profile_circular_navigators.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/widgets/app_profile_info_card.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/widgets/app_profile_notification_tile.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/widgets/app_profile_switch.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/widgets/app_profile_tile.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/cubit/main_home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/widgets/app_profile_header.dart';

class ProfileScreen extends StatelessWidget {
  final MainHomeCubit mainHomeCubit;

  const ProfileScreen({super.key, required this.mainHomeCubit});

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
                  label: AppStrings.dismiss,
                  textColor: AppColors.white,
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
                  label: AppStrings.dismiss,
                  textColor: AppColors.white,
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
              color: AppColors.white,
              child: Column(children: const [SizedBox(height: 16)]),
            );
          }

          final cubit = context.read<ProfileCubit>();
          final circularNavigators = cubit.getCircularNavigators();

          return Container(
            color: AppColors.white,
            child: Column(
              children: [
                AppProfileHeader(
                  title: AppStrings.profileTitle,
                  onBack: () => mainHomeCubit.navigateBack(),
                ),
                SizedBox(height: 13),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(height: 6, color: AppColors.body100),
                        SizedBox(height: 16),
                        Stack(
                          children: [
                            AppProfileInfoCard(
                              profileData: state.profileData,
                              onUpdateProfile: cubit.updateProfile,
                              onLogout: cubit.logout,
                            ),
                            if (state.isUpdatingProfile)
                              Positioned.fill(
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primaryOrange,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 16),
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
                        SizedBox(height: 10),
                        Container(height: 11, color: AppColors.body200),
                        SizedBox(height: 22),
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
                            iconWidth: item.iconWidth,
                            iconHeight: item.iconHeight,
                          );
                        }).toList(),
                        Container(height: 11, color: AppColors.body100),
                        SizedBox(height: 16),
                        ...state.switchItems
                            .map(
                              (item) => AppProfileSwitch(
                                mainText: item.mainText,
                                icon: item.icon,
                                fontSize: item.fontSize,
                                secondaryText: item.secondaryText,
                                isSwitched: item.isEnabled,
                                onChanged: item.onChanged,
                                hasDivider: item.hasDivider,
                              ),
                            )
                            .toList(),
                        SizedBox(height: 48),
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
