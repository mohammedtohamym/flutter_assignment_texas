class CartState {
  final Map<int, int> cartItems; // itemId -> quantity
  final bool isLoading;

  CartState({this.cartItems = const {}, this.isLoading = false});

  CartState copyWith({Map<int, int>? cartItems, bool? isLoading}) {
    return CartState(
      cartItems: cartItems ?? this.cartItems,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  // Get total number of items in cart
  int get totalItems {
    return cartItems.values.fold(0, (sum, quantity) => sum + quantity);
  }

  // Get number of unique items in cart
  int get uniqueItemsCount => cartItems.length;

  // Check if cart is empty
  bool get isEmpty => cartItems.isEmpty;

  // Check if cart has items
  bool get hasItems => cartItems.isNotEmpty;

  // Get quantity for specific item
  int getItemQuantity(int itemId) {
    return cartItems[itemId] ?? 0;
  }

  // Check if item is in cart
  bool isItemInCart(int itemId) {
    return cartItems.containsKey(itemId);
  }
}

class CartInitialState extends CartState {
  CartInitialState() : super();
}

class CartLoadingState extends CartState {
  CartLoadingState() : super(isLoading: true);
}

class CartUpdatedState extends CartState {
  CartUpdatedState({required super.cartItems}) : super(isLoading: false);
}
