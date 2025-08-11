import 'dart:async';
import 'package:flutter_assignment_texas/domain/entities/restaurant_items_response_entity.dart';
import 'package:flutter_assignment_texas/presentation/cubits/cart/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  Timer? _overlayTimer;
  Timer? _debounceTimer;

  CartCubit() : super(CartInitialState());

  void addToCart(int itemId) {
    final cartItems = Map<int, int>.from(state.cartItems);
    cartItems[itemId] = (cartItems[itemId] ?? 0) + 1;
    
    // Emit updated state with overlay visible
    emit(CartUpdatedState(cartItems: cartItems, showOverlay: true));
    
    // Show overlay briefly (debounced)
    _showOverlayBriefly();
  }

  void removeFromCart(int itemId) {
    final cartItems = Map<int, int>.from(state.cartItems);
    final currentQuantity = cartItems[itemId] ?? 0;

    if (currentQuantity > 1) {
      cartItems[itemId] = currentQuantity - 1;
    } else {
      cartItems.remove(itemId);
    }
    emit(CartUpdatedState(cartItems: cartItems));
  }

  void removeItemCompletelyFromCart(int itemId) {
    final cartItems = Map<int, int>.from(state.cartItems);
    cartItems.remove(itemId);
    emit(CartUpdatedState(cartItems: cartItems));
  }

  void clearCart() {
    emit(CartUpdatedState(cartItems: {}));
  }

  void _showOverlayBriefly() {
    // Cancel existing timers
    _debounceTimer?.cancel();
    _overlayTimer?.cancel();

    // Debounce: only show overlay if no new items are added within 500ms
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      // Show overlay for 3 seconds
      _overlayTimer = Timer(const Duration(seconds: 3), () {
        // Hide overlay
        if (!isClosed) {
          emit(state.copyWith(showOverlay: false));
        }
      });
    });
  }

  bool isItemInCart(int itemId) {
    return state.cartItems.containsKey(itemId);
  }

  int getItemQuantityInCart(int itemId) {
    return state.cartItems[itemId] ?? 0;
  }

  // Get total items count in cart
  int get totalCartItems {
    return state.cartItems.values.fold(0, (sum, quantity) => sum + quantity);
  }

  // Get total cart value
  double getTotalCartValue(List<RestaurantItemsResponseEntity> allItems) {
    double total = 0;
    state.cartItems.forEach((itemId, quantity) {
      final itemMatches = allItems.where((item) => item.itemID == itemId);
      if (itemMatches.isNotEmpty) {
        final item = itemMatches.first;
        total += (item.itemPrice ?? 0) * quantity;
      }
    });
    return total;
  }

  // Get cart items with details
  List<MapEntry<RestaurantItemsResponseEntity, int>> getCartItemsWithDetails(
    List<RestaurantItemsResponseEntity> allItems,
  ) {
    final result = <MapEntry<RestaurantItemsResponseEntity, int>>[];

    state.cartItems.entries.forEach((entry) {
      final itemMatches = allItems.where((item) => item.itemID == entry.key);
      if (itemMatches.isNotEmpty) {
        final item = itemMatches.first;
        result.add(MapEntry(item, entry.value));
      }
    });

    
    return result;
  }

  @override
  Future<void> close() {
    _overlayTimer?.cancel();
    _debounceTimer?.cancel();
    return super.close();
  }
}