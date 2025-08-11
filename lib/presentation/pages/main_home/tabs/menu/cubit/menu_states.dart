import 'package:flutter_assignment_texas/core/errors/failures.dart';
import 'package:flutter_assignment_texas/core/resources/app_strings.dart';
import 'package:flutter_assignment_texas/domain/entities/restaurant_items_response_entity.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/utils/menu_category_utils.dart';

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
          .where(
            (item) =>
                MenuCategoryUtils.getCategoryFromItem(item) == selectedCategory,
          )
          .length;
    }
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
