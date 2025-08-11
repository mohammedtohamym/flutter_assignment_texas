import 'package:flutter_assignment_texas/domain/use_cases/get_restaurant_items_use_case.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/cubit/menu_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_assignment_texas/domain/entities/restaurant_items_response_entity.dart';
import 'package:flutter_assignment_texas/core/resources/app_strings.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/utils/menu_category_utils.dart';

class MenuCubit extends Cubit<MenuState> {
  final GetRestaurantItemsUseCase getRestaurantItemsUseCase;

  MenuCubit({required this.getRestaurantItemsUseCase})
    : super(MenuInitialState());

  void fetchRestaurantItems() async {
    emit(MenuLoadingState());
    final result = await getRestaurantItemsUseCase.call();
    result.fold(
      (error) => emit(MenuErrorState(errors: error)),
      (items) => _processSuccessfulFetch(items),
    );
  }

  void _processSuccessfulFetch(List<RestaurantItemsResponseEntity> items) {
    // Extract unique categories from items
    final categories = _extractCategoriesFromItems(items);

    emit(
      MenuSuccessState(
        allItems: items,
        filteredItems: items,
        categories: categories,
        selectedCategory: categories.isNotEmpty ? categories.first : '',
        favoriteItems: state.favoriteItems,
        searchQuery: '',
      ),
    );
  }

  List<String> _extractCategoriesFromItems(
    List<RestaurantItemsResponseEntity> items,
  ) {
    final categories = <String>{};
    for (final item in items) {
      categories.add(MenuCategoryUtils.getCategoryFromItem(item));
    }
    final categoryList = categories.toList()..sort();

    // Add special categories at the beginning
    categoryList.insert(0, AppStrings.all);

    return categoryList;
  }

  void selectCategory(String category) {
    final filteredItems = _applyFilters(
      state.allItems,
      category,
      '', // Clear search query when selecting a category
    );
    emit(
      state.copyWith(
        selectedCategory: category,
        filteredItems: filteredItems,
        searchQuery: '', // Clear search query in state
      ),
    );
  }

  void searchItems(String query) {
    final filteredItems = _applyFilters(
      state.allItems,
      state.selectedCategory,
      query,
    );
    emit(state.copyWith(searchQuery: query, filteredItems: filteredItems));
  }

  List<RestaurantItemsResponseEntity> _applyFilters(
    List<RestaurantItemsResponseEntity> items,
    String category,
    String searchQuery,
  ) {
    var filtered = items;

    // Apply category filter
    if (category.isNotEmpty && category != AppStrings.all) {
      if (category == AppStrings.favorites) {
        // Filter to show only favorite items
        filtered = filtered
            .where((item) => state.favoriteItems.contains(item.itemID))
            .toList();
      } else {
        // Filter by regular category
        filtered = filtered
            .where(
              (item) => MenuCategoryUtils.getCategoryFromItem(item) == category,
            )
            .toList();
      }
    }

    // Apply search filter
    if (searchQuery.isNotEmpty) {
      filtered = filtered.where((item) {
        final name = item.itemName?.toLowerCase() ?? '';
        final description = item.itemDescription?.toLowerCase() ?? '';
        final query = searchQuery.toLowerCase();
        return name.contains(query) || description.contains(query);
      }).toList();
    }

    return filtered;
  }

  List<RestaurantItemsResponseEntity> _applyFiltersWithFavorites(
    List<RestaurantItemsResponseEntity> items,
    String category,
    String searchQuery,
    Set<int> favoriteItems,
  ) {
    var filtered = items;

    // Apply category filter
    if (category.isNotEmpty && category != AppStrings.all) {
      if (category == AppStrings.favorites) {
        // Filter to show only favorite items using the provided favorites set
        filtered = filtered
            .where((item) => favoriteItems.contains(item.itemID))
            .toList();
      } else {
        // Filter by regular category
        filtered = filtered
            .where(
              (item) => MenuCategoryUtils.getCategoryFromItem(item) == category,
            )
            .toList();
      }
    }

    // Apply search filter
    if (searchQuery.isNotEmpty) {
      filtered = filtered.where((item) {
        final name = item.itemName?.toLowerCase() ?? '';
        final description = item.itemDescription?.toLowerCase() ?? '';
        final query = searchQuery.toLowerCase();
        return name.contains(query) || description.contains(query);
      }).toList();
    }

    return filtered;
  }

  void toggleFavorite(int itemId) {
    final favorites = Set<int>.from(state.favoriteItems);
    if (favorites.contains(itemId)) {
      favorites.remove(itemId);
    } else {
      favorites.add(itemId);
    }

    // Re-apply filters with the updated favorites set
    final filteredItems = _applyFiltersWithFavorites(
      state.allItems,
      state.selectedCategory,
      state.searchQuery,
      favorites,
    );

    emit(
      state.copyWith(favoriteItems: favorites, filteredItems: filteredItems),
    );
  }

  // Add all items in current category to favorites
  void addAllCurrentItemsToFavorites() {
    final favorites = Set<int>.from(state.favoriteItems);
    for (final item in state.filteredItems) {
      if (item.itemID != null) {
        favorites.add(item.itemID!);
      }
    }

    final filteredItems = _applyFiltersWithFavorites(
      state.allItems,
      state.selectedCategory,
      state.searchQuery,
      favorites,
    );

    emit(
      state.copyWith(favoriteItems: favorites, filteredItems: filteredItems),
    );
  }

  // Remove all items in current category from favorites
  void removeAllCurrentItemsFromFavorites() {
    final favorites = Set<int>.from(state.favoriteItems);
    for (final item in state.filteredItems) {
      if (item.itemID != null) {
        favorites.remove(item.itemID!);
      }
    }

    final filteredItems = _applyFiltersWithFavorites(
      state.allItems,
      state.selectedCategory,
      state.searchQuery,
      favorites,
    );

    emit(
      state.copyWith(favoriteItems: favorites, filteredItems: filteredItems),
    );
  }

  bool isItemFavorite(int itemId) {
    return state.favoriteItems.contains(itemId);
  }

  // Get all favorite items
  List<RestaurantItemsResponseEntity> get favoriteItems {
    return state.allItems
        .where((item) => state.favoriteItems.contains(item.itemID))
        .toList();
  }

  // Get favorite items count
  int get favoriteItemsCount => state.favoriteItems.length;

  // Clear all favorites
  void clearAllFavorites() {
    emit(state.copyWith(favoriteItems: <int>{}));
  }

  // Get items for current category and search
  List<RestaurantItemsResponseEntity> get currentItems => state.filteredItems;
}
