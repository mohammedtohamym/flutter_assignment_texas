import 'package:flutter_assignment_texas/domain/entities/restaurant_items_response_entity.dart';

class RestaurantItemsResponseDto extends RestaurantItemsResponseEntity {
  RestaurantItemsResponseDto({
    super.itemID,
    super.itemName,
    super.itemDescription,
    super.itemPrice,
    super.restaurantName,
    super.restaurantID,
    super.imageUrl,
  });

  factory RestaurantItemsResponseDto.fromJson(Map<String, dynamic> json) {
    return RestaurantItemsResponseDto(
      itemID: json['itemID'] as int?,
      itemName: json['itemName'] as String?,
      itemDescription: json['itemDescription'] as String?,
      itemPrice: (json['itemPrice'] as num?)?.toDouble(),
      restaurantName: json['restaurantName'] as String?,
      restaurantID: json['restaurantID'] as int?,
      imageUrl: json['imageUrl'] as String?,
    );
  }

  RestaurantItemsResponseEntity toEntity() {
    return RestaurantItemsResponseEntity(
      itemID: itemID,
      itemName: itemName,
      itemDescription: itemDescription,
      itemPrice: itemPrice?.toDouble(),
      restaurantName: restaurantName,
      restaurantID: restaurantID,
      imageUrl: imageUrl,
    );
  }
}
