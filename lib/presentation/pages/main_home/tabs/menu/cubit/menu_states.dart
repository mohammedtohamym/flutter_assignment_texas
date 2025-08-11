import 'package:flutter_assignment_texas/core/errors/failures.dart';
import 'package:flutter_assignment_texas/domain/entities/restaurant_items_response_entity.dart';

class MenuState {
  final List<RestaurantItemsResponseEntity> allItems;
  final List<RestaurantItemsResponseEntity> filteredItems;
  final List<String> categories;
  final String selectedCategory;
  final Map<int, int> cartItems; // itemId -> quantity
  final Set<int> favoriteItems;
  final bool isLoading;
  final String searchQuery;
  final Failures? error;

  MenuState({
    this.allItems = const [],
    this.filteredItems = const [],
    this.categories = const [],
    this.selectedCategory = '',
    this.cartItems = const {},
    this.favoriteItems = const {},
    this.isLoading = false,
    this.searchQuery = '',
    this.error,
  });

  MenuState copyWith({
    List<RestaurantItemsResponseEntity>? allItems,
    List<RestaurantItemsResponseEntity>? filteredItems,
    List<String>? categories,
    String? selectedCategory,
    Map<int, int>? cartItems,
    Set<int>? favoriteItems,
    bool? isLoading,
    String? searchQuery,
    Failures? error,
  }) {
    return MenuState(
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      cartItems: cartItems ?? this.cartItems,
      favoriteItems: favoriteItems ?? this.favoriteItems,
      isLoading: isLoading ?? this.isLoading,
      searchQuery: searchQuery ?? this.searchQuery,
      error: error,
    );
  }

  String get selectedCategoryName =>
      selectedCategory.isEmpty ? 'All Items' : selectedCategory;

  int get selectedCategoryItemCount {
    if (selectedCategory.isEmpty) {
      return filteredItems.length;
    } else if (selectedCategory == 'Favorites') {
      return favoriteItems.length;
    } else {
      return filteredItems
          .where((item) => _getCategoryFromItem(item) == selectedCategory)
          .length;
    }
  }

  String _getCategoryFromItem(RestaurantItemsResponseEntity item) {
    if (item.itemName?.toLowerCase().contains('sandwich') == true) {
      return 'Sandwiches';
    } else if (item.itemName?.toLowerCase().contains('burger') == true) {
      return 'Burgers';
    } else if (item.itemName?.toLowerCase().contains('pizza') == true) {
      return 'Pizza';
    } else if (item.itemName?.toLowerCase().contains('salad') == true) {
      return 'Salads';
    } else if (item.itemName?.toLowerCase().contains('drink') == true) {
      return 'Drinks';
    }
    return 'Others';
  }
}

class MenuInitialState extends MenuState {
  MenuInitialState() : super(isLoading: true);
}

class MenuLoadingState extends MenuState {
  MenuLoadingState() : super(isLoading: true);
}

class MenuSuccessState extends MenuState {
  MenuSuccessState({
    required super.allItems,
    required super.filteredItems,
    required super.categories,
    required super.selectedCategory,
    required super.cartItems,
    required super.favoriteItems,
    required super.searchQuery,
  }) : super(isLoading: false);
}

class MenuErrorState extends MenuState {
  MenuErrorState({required Failures errors})
    : super(error: errors, isLoading: false);
}
