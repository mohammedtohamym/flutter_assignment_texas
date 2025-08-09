import 'package:dartz/dartz.dart';
import 'package:flutter_assignment_texas/core/errors/failures.dart';
import 'package:flutter_assignment_texas/domain/entities/restaurant_items_response_entity.dart';

abstract class RestaurantItemsRepository {
  Future<Either<Failures, List<RestaurantItemsResponseEntity>>>
  getRestaurantItems();
}
