import 'package:flutter/material.dart';

class ProfileState {
  final ProfileData profileData;
  final List<ProfileMenuItem> menuItems;
  final List<ProfileSwitchItem> switchItems;
  final bool isLoading;
  final bool isUpdatingProfile;
  final String? error;
  final String? successMessage;

  const ProfileState({
    required this.profileData,
    required this.menuItems,
    required this.switchItems,
    this.isLoading = false,
    this.isUpdatingProfile = false,
    this.error,
    this.successMessage,
  });

  ProfileState copyWith({
    ProfileData? profileData,
    List<ProfileMenuItem>? menuItems,
    List<ProfileSwitchItem>? switchItems,
    bool? isLoading,
    bool? isUpdatingProfile,
    String? error,
    String? successMessage,
  }) {
    return ProfileState(
      profileData: profileData ?? this.profileData,
      menuItems: menuItems ?? this.menuItems,
      switchItems: switchItems ?? this.switchItems,
      isLoading: isLoading ?? this.isLoading,
      isUpdatingProfile: isUpdatingProfile ?? this.isUpdatingProfile,
      error: error,
      successMessage: successMessage,
    );
  }
}

class ProfileInitialState extends ProfileState {
  ProfileInitialState()
    : super(
        profileData: ProfileData.empty(),
        menuItems: [],
        switchItems: [],
        isLoading: true,
      );
}

// Data Models
class ProfileData {
  final String name;
  final String phone;
  final String email;
  final String? imagePath;
  final String countryIcon;
  final int notificationCount;

  const ProfileData({
    required this.name,
    required this.phone,
    required this.email,
    this.imagePath,
    required this.countryIcon,
    this.notificationCount = 0,
  });

  factory ProfileData.empty() {
    return const ProfileData(name: '', phone: '', email: '', countryIcon: '');
  }

  ProfileData copyWith({
    String? name,
    String? phone,
    String? email,
    String? imagePath,
    String? countryIcon,
    int? notificationCount,
  }) {
    return ProfileData(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      imagePath: imagePath ?? this.imagePath,
      countryIcon: countryIcon ?? this.countryIcon,
      notificationCount: notificationCount ?? this.notificationCount,
    );
  }
}

class ProfileMenuItem {
  final String text;
  final String icon;
  final Color? textColor;
  final bool hasSuffixIcon;
  final bool hasDivider;
  final int? count;
  final VoidCallback? onTap;

  const ProfileMenuItem({
    required this.text,
    required this.icon,
    this.textColor,
    this.hasSuffixIcon = true,
    this.hasDivider = true,
    this.count,
    this.onTap,
  });

  ProfileMenuItem copyWith({
    String? text,
    String? icon,
    Color? textColor,
    bool? hasSuffixIcon,
    bool? hasDivider,
    int? count,
    VoidCallback? onTap,
  }) {
    return ProfileMenuItem(
      text: text ?? this.text,
      icon: icon ?? this.icon,
      textColor: textColor ?? this.textColor,
      hasSuffixIcon: hasSuffixIcon ?? this.hasSuffixIcon,
      hasDivider: hasDivider ?? this.hasDivider,
      count: count ?? this.count,
      onTap: onTap ?? this.onTap,
    );
  }
}

class ProfileSwitchItem {
  final String mainText;
  final String secondaryText;
  final String icon;
  final bool isEnabled;
  final Function(bool)? onChanged;

  const ProfileSwitchItem({
    required this.mainText,
    required this.secondaryText,
    required this.icon,
    this.isEnabled = false,
    this.onChanged,
  });

  ProfileSwitchItem copyWith({
    String? mainText,
    String? secondaryText,
    String? icon,
    bool? isEnabled,
    Function(bool)? onChanged,
  }) {
    return ProfileSwitchItem(
      mainText: mainText ?? this.mainText,
      secondaryText: secondaryText ?? this.secondaryText,
      icon: icon ?? this.icon,
      isEnabled: isEnabled ?? this.isEnabled,
      onChanged: onChanged ?? this.onChanged,
    );
  }
}

class ProfileCircularNavigator {
  final String title;
  final String imagePath;
  final VoidCallback? onTap;

  const ProfileCircularNavigator({
    required this.title,
    required this.imagePath,
    this.onTap,
  });
}
