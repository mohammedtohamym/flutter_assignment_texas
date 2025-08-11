import 'package:flutter_assignment_texas/core/errors/failures.dart';
import 'package:flutter_assignment_texas/core/resources/app_strings.dart';
import 'package:flutter_assignment_texas/domain/entities/restaurant_items_response_entity.dart';

class MenuState {
  final List<RestaurantItemsResponseEntity> allItems;
  final List<RestaurantItemsResponseEntity> filteredItems;
  final List<String> categories;
  final String selectedCategory;
  final Set<int> favoriteItems;
  final bool isLoading;
  final String searchQuery;
  final Failures? error;

  MenuState({
    this.allItems = const [],
    this.filteredItems = const [],
    this.categories = const [],
    this.selectedCategory = '',
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
      favoriteItems: favoriteItems ?? this.favoriteItems,
      isLoading: isLoading ?? this.isLoading,
      searchQuery: searchQuery ?? this.searchQuery,
      error: error,
    );
  }

  String get selectedCategoryName =>
      selectedCategory.isEmpty ? AppStrings.allItems : selectedCategory;

  int get selectedCategoryItemCount {
    if (selectedCategory.isEmpty || selectedCategory == AppStrings.all) {
      return filteredItems.length;
    } else if (selectedCategory == AppStrings.favorites) {
      return favoriteItems.length;
    } else {
      return allItems
          .where((item) => _getCategoryFromItem(item) == selectedCategory)
          .length;
    }
  }

  String _getCategoryFromItem(RestaurantItemsResponseEntity item) {
    final itemName = item.itemName?.toLowerCase() ?? '';

    // Main dishes
    if (itemName.contains('biryani')) {
      return 'Biryani';
    } else if (itemName.contains('curry')) {
      return 'Curries';
    } else if (itemName.contains('kebab')) {
      return 'Kebabs';
    } else if (itemName.contains('chicken') || itemName.contains('murg')) {
      return 'Chicken';
    } else if (itemName.contains('mutton') || itemName.contains('lamb')) {
      return 'Mutton & Lamb';
    } else if (itemName.contains('fish') ||
        itemName.contains('prawn') ||
        itemName.contains('seafood')) {
      return 'Fish & Seafood';
    } else if (itemName.contains('pizza')) {
      return 'Pizza';
    } else if (itemName.contains('pasta') || itemName.contains('mac')) {
      return 'Pasta';
    }
    // Traditional Indian
    else if (itemName.contains('idli') ||
        itemName.contains('dosa') ||
        itemName.contains('vada') ||
        itemName.contains('sambar')) {
      return 'South Indian';
    } else if (itemName.contains('naan') || itemName.contains('roti')) {
      return 'Breads';
    } else if (itemName.contains('thali') || itemName.contains('sadya')) {
      return 'Traditional Meals';
    }
    // Desserts
    else if (itemName.contains('jamun') ||
        itemName.contains('meetha') ||
        itemName.contains('kulfi') ||
        itemName.contains('cake') ||
        itemName.contains('tukda') ||
        itemName.contains('firni') ||
        itemName.contains('baklava') ||
        itemName.contains('tiramisu') ||
        itemName.contains('sorbet') ||
        itemName.contains('roshogolla') ||
        itemName.contains('sandesh') ||
        itemName.contains('pak') ||
        itemName.contains('payasam') ||
        itemName.contains('ghevar') ||
        itemName.contains('doi')) {
      return 'Desserts';
    }
    // Beverages
    else if (itemName.contains('coffee') ||
        itemName.contains('lassi') ||
        itemName.contains('brew') ||
        itemName.contains('drink')) {
      return 'Beverages';
    }
    // Snacks
    else if (itemName.contains('samosa') || itemName.contains('pav')) {
      return 'Snacks';
    }
    // Soups
    else if (itemName.contains('soup')) {
      return 'Soups';
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
    required super.favoriteItems,
    required super.searchQuery,
  }) : super(isLoading: false);
}

class MenuErrorState extends MenuState {
  MenuErrorState({required Failures errors})
    : super(error: errors, isLoading: false);
}
