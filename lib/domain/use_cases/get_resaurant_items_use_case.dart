import 'package:dartz/dartz.dart';
import 'package:flutter_assignment_texas/core/errors/failures.dart';
import 'package:flutter_assignment_texas/domain/entities/restaurant_items_response_entity.dart';
import 'package:flutter_assignment_texas/domain/repositories/data_sources/remote/restaurant_items_repository.dart';

class GetRestaurantItemsUseCase {
  final RestaurantItemsRepository repository;

  GetRestaurantItemsUseCase(this.repository);

  Future<Either<Failures, List<RestaurantItemsResponseEntity>>> call() {
    return repository.getRestaurantItems();
  }
}
