class AppStrings {
  // General
  static const String home = 'Home';
  static const String menu = 'Menu';
  static const String profile = 'Profile';
  static const String profileTitle = 'PROFILE';
  static const String more = 'More';
  static const String loading = 'Loading...';
  static const String retry = 'Retry';
  static const String dismiss = 'Dismiss';
  static const String clear = 'Clear';
  static const String close = 'Close';

  // Home & More
  static const String homeScreenTitle = 'Home Screen';
  static const String moreScreenTitle = 'More Screen';
  static const String cartScreenTitle = 'Cart Screen';

  // Menu
  static const String exploreMenu = 'EXPLORE MENU';
  static const String errorLoadingMenuItems = 'Error loading menu items';
  static const String favorites = 'Favorites';
  static const String all = 'All';
  static const String allItems = 'All Items';
  static const String noFavoritesYet = 'No favorite items yet';
  static const String noItemsFound = 'No items found';
  static const String tapHeartToFavorite =
      'Tap the heart icon on items to add them to favorites';
  static const String searchTheMenu = 'Search The Menu';
  static const String searchHint = 'Search for items...';
  static String itemsCount(int count) => '($count Items)';
  static String searchQueryLabel(String q) => '• Search: "$q"';

  // Menu Item Card
  static const String addToCart = 'Add to Cart';
  static const String customize = 'Customize';
  static const String unknownItem = 'Unknown Item';
  static const String noDescription = 'No description available';

  // Cart Overlay
  static const String viewCart = 'view cart';

  // Profile
  static const String updateProfile = 'Update Profile';
  static const String logout = 'Logout';
  static const String myAddresses = 'My Addresses';
  static const String changePassword = 'Change Password';
  static const String offers = 'Offers';
  static const String deals = 'Deals';
  static const String notifications = 'Notifications';
  static const String deleteMyAccount = 'Delete my Account';
  static const String marketingCommunication = 'Marketing Communication';
  static const String marketingCommunicationDesc =
      'once you open it you will receive emails and offer on your inbox';
  static const String appCommunication = 'App Communication';
  static const String appCommunicationDesc =
      'Once you open it you will receive Notifications from our app';
  static const String favoritesTitle = 'Favorites';
  static const String rewardsTitle = 'Rewards';
  static const String ordersTitle = 'Orders';

  // Profile messages
  static const String profileUpdateSuccess = 'Profile updated successfully!';
  static const String profileUpdateFailed =
      'Failed to update profile. Please try again.';
  static const String failedToLogout = 'Failed to logout. Please try again.';
  static const String deleteAccountWarning =
      'This action will permanently delete your account. Please contact support if you want to proceed.';
}
