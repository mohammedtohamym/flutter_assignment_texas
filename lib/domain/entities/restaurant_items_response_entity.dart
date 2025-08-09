class RestaurantItemsResponseEntity {
  int? itemID;
  String? itemName;
  String? itemDescription;
  double? itemPrice;
  String? restaurantName;
  int? restaurantID;
  String? imageUrl;

  RestaurantItemsResponseEntity({
    this.itemID,
    this.itemName,
    this.itemDescription,
    this.itemPrice,
    this.restaurantName,
    this.restaurantID,
    this.imageUrl,
  });
}
