import 'package:flutter_assignment_texas/domain/entities/restaurant_items_response_entity.dart';

/// Central utility for deriving menu categories from restaurant items.
class MenuCategoryUtils {
  const MenuCategoryUtils._();

  static String getCategoryFromItem(RestaurantItemsResponseEntity item) {
    final itemName = (item.itemName ?? '').toLowerCase();

    // Main dishes
    if (itemName.contains('biryani')) return 'Biryani';
    if (itemName.contains('curry')) return 'Curries';
    if (itemName.contains('kebab')) return 'Kebabs';
    if (itemName.contains('chicken') || itemName.contains('murg')) {
      return 'Chicken';
    }
    if (itemName.contains('mutton') || itemName.contains('lamb')) {
      return 'Mutton & Lamb';
    }
    if (itemName.contains('fish') ||
        itemName.contains('prawn') ||
        itemName.contains('seafood')) {
      return 'Fish & Seafood';
    }
    if (itemName.contains('pizza')) return 'Pizza';
    if (itemName.contains('pasta') || itemName.contains('mac')) return 'Pasta';

    // Traditional Indian
    if (itemName.contains('idli') ||
        itemName.contains('dosa') ||
        itemName.contains('vada') ||
        itemName.contains('sambar')) {
      return 'South Indian';
    }
    if (itemName.contains('naan') || itemName.contains('roti')) return 'Breads';
    if (itemName.contains('thali') || itemName.contains('sadya')) {
      return 'Traditional Meals';
    }

    // Desserts
    if (itemName.contains('jamun') ||
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
    if (itemName.contains('coffee') ||
        itemName.contains('lassi') ||
        itemName.contains('brew') ||
        itemName.contains('drink')) {
      return 'Beverages';
    }

    // Snacks
    if (itemName.contains('samosa') || itemName.contains('pav')) {
      return 'Snacks';
    }

    // Soups
    if (itemName.contains('soup')) return 'Soups';

    return 'Others';
  }
}
