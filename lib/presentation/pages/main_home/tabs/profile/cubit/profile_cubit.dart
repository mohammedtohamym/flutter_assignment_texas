import 'package:flutter_assignment_texas/core/resources/app_assets.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/cubit/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState()) {
    _initializeProfile();
  }

  void _initializeProfile() async {
    // Mock data
    emit(state.copyWith(isLoading: true));

    // Simulating network delay
    await Future.delayed(const Duration(milliseconds: 500));

    final profileData = ProfileData(
      name: 'Ahmed Magdy',
      phone: '012-000-00-663',
      email: 'ahmed@paradigmegypt.com',
      countryIcon: AppAssets.egyptFlagIcon,
      notificationCount: 1,
    );

    final menuItems = _buildMenuItemsWithNotificationCount(
      profileData.notificationCount,
    );
    final switchItems = _buildSwitchItems();

    emit(
      state.copyWith(
        profileData: profileData,
        menuItems: menuItems,
        switchItems: switchItems,
        isLoading: false,
      ),
    );
  }

  List<ProfileMenuItem> _buildMenuItemsWithNotificationCount(
    int notificationCount,
  ) {
    return [
      ProfileMenuItem(
        text: 'My Addresses',
        icon: AppAssets.addressIcon,
        iconWidth: 13,
        onTap: () => _onAddressesPressed(),
      ),
      ProfileMenuItem(
        text: 'Change Password',
        icon: AppAssets.passwordIcon,
        iconWidth: 20,
        onTap: () => _onChangePasswordPressed(),
      ),
      ProfileMenuItem(
        text: 'Offers',
        icon: AppAssets.offersIcon,
        iconWidth: 17,
        onTap: () => _onOffersPressed(),
      ),
      ProfileMenuItem(
        text: 'Deals',
        icon: AppAssets.dealsIcon,
        iconWidth: 14,
        onTap: () => _onDealsPressed(),
      ),
      ProfileMenuItem(
        text: 'Notifications',
        icon: AppAssets.notificationsIcon,
        iconWidth: 16,
        count: notificationCount,
        onTap: () => _onNotificationsPressed(),
      ),
      ProfileMenuItem(
        text: 'Delete my Account',
        icon: AppAssets.deleteAccountIcon,
        iconWidth: 17,
        textColor: AppColors.secondaryRed,
        hasSuffixIcon: false,
        hasDivider: false,
        onTap: () => _onDeleteAccountPressed(),
      ),
    ];
  }

  List<ProfileSwitchItem> _buildSwitchItems() {
    return [
      ProfileSwitchItem(
        mainText: 'Marketing Communication',
        icon: AppAssets.marketingIcon,
        secondaryText:
            'once you open it you will receive emails and offer on your inbox',
        isEnabled: false,
        onChanged: (value) => _onMarketingCommunicationChanged(value),
        hasDivider: true,
      ),
      ProfileSwitchItem(
        mainText: 'App Communication',
        icon: AppAssets.communicationIcon,
        secondaryText:
            'Once you open it you will receive Notifications from our app',
        isEnabled: true,
        onChanged: (value) => _onAppCommunicationChanged(value),
        fontSize: 18.0,
        hasDivider: false,
      ),
    ];
  }

  List<ProfileCircularNavigator> getCircularNavigators() {
    return [
      ProfileCircularNavigator(
        title: 'Favorites',
        imagePath: AppAssets.favoritesIcon,
        onTap: () => _onFavoritesPressed(),
      ),
      ProfileCircularNavigator(
        title: 'Rewards',
        imagePath: AppAssets.awardsIcon,
        onTap: () => _onRewardsPressed(),
      ),
      ProfileCircularNavigator(
        title: 'Orders',
        imagePath: AppAssets.ordersIcon,
        onTap: () => _onOrdersPressed(),
      ),
    ];
  }

  void updateProfile() async {
    emit(state.copyWith(isUpdatingProfile: true));

    try {
      // fake API call
      await Future.delayed(const Duration(seconds: 1));

      emit(
        state.copyWith(
          isUpdatingProfile: false,
          successMessage: 'Profile updated successfully!',
        ),
      );

      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(successMessage: null));
    } catch (e) {
      emit(
        state.copyWith(
          isUpdatingProfile: false,
          error: 'Failed to update profile. Please try again.',
        ),
      );

      await Future.delayed(const Duration(seconds: 3));
      emit(state.copyWith(error: null));
    }
  }

  void logout() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      print('User logged out successfully');
    } catch (e) {
      emit(state.copyWith(error: 'Failed to logout. Please try again.'));
    }
  }

  void updateNotificationCount(int count) {
    final updatedProfile = state.profileData.copyWith(notificationCount: count);
    final updatedMenuItems = _buildMenuItemsWithNotificationCount(count);

    emit(
      state.copyWith(profileData: updatedProfile, menuItems: updatedMenuItems),
    );
  }

  void updateProfileData({
    String? name,
    String? phone,
    String? email,
    String? imagePath,
  }) {
    final updatedProfile = state.profileData.copyWith(
      name: name,
      phone: phone,
      email: email,
      imagePath: imagePath,
    );

    emit(state.copyWith(profileData: updatedProfile));
  }

  void _onMarketingCommunicationChanged(bool value) async {
    print('Marketing Communication changing to: $value');

    final updatedSwitchItems = state.switchItems.map((item) {
      if (item.mainText == 'Marketing Communication') {
        return item.copyWith(isEnabled: value);
      }
      return item;
    }).toList();

    emit(state.copyWith(switchItems: updatedSwitchItems));

    try {
      await Future.delayed(const Duration(milliseconds: 300));
      print('Marketing Communication preference saved: $value');
    } catch (e) {
      final revertedSwitchItems = state.switchItems.map((item) {
        if (item.mainText == 'Marketing Communication') {
          return item.copyWith(isEnabled: !value);
        }
        return item;
      }).toList();

      emit(
        state.copyWith(
          switchItems: revertedSwitchItems,
          error: 'Failed to update preference. Please try again.',
        ),
      );
    }
  }

  void _onAppCommunicationChanged(bool value) async {
    print('App Communication changing to: $value');

    final updatedSwitchItems = state.switchItems.map((item) {
      if (item.mainText == 'App Communication') {
        return item.copyWith(isEnabled: value);
      }
      return item;
    }).toList();

    emit(state.copyWith(switchItems: updatedSwitchItems));

    try {
      await Future.delayed(const Duration(milliseconds: 300));
      print('App Communication preference saved: $value');
    } catch (e) {
      final revertedSwitchItems = state.switchItems.map((item) {
        if (item.mainText == 'App Communication') {
          return item.copyWith(isEnabled: !value);
        }
        return item;
      }).toList();

      emit(
        state.copyWith(
          switchItems: revertedSwitchItems,
          error: 'Failed to update preference. Please try again.',
        ),
      );
    }
  }

  void _onAddressesPressed() {
    print('My Addresses pressed');
  }

  void _onChangePasswordPressed() {
    print('Change Password pressed');
  }

  void _onOffersPressed() {
    print('Offers pressed');
  }

  void _onDealsPressed() {
    print('Deals pressed');
  }

  void _onNotificationsPressed() {
    print('Notifications pressed');
    updateNotificationCount(0);
  }

  void _onDeleteAccountPressed() {
    print('Delete Account pressed');
    emit(
      state.copyWith(
        error:
            'This action will permanently delete your account. Please contact support if you want to proceed.',
      ),
    );
  }

  void _onFavoritesPressed() {
    print('Favorites pressed');
  }

  void _onRewardsPressed() {
    print('Rewards pressed');
  }

  void _onOrdersPressed() {
    print('Orders pressed');
  }

  void clearError() {
    emit(state.copyWith(error: null));
  }

  void clearSuccessMessage() {
    emit(state.copyWith(successMessage: null));
  }
}
