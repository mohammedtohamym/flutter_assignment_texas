import 'package:dartz/dartz.dart';
import 'package:flutter_assignment_texas/core/errors/failures.dart';
import 'package:flutter_assignment_texas/domain/repositories/data_sources/remote/restaurant_items_remote_data_source.dart';
import 'package:flutter_assignment_texas/domain/entities/restaurant_items_response_entity.dart';
import 'package:flutter_assignment_texas/domain/repositories/restaurant_items_repository.dart';

class RestaurantItemsRepositoryImpl implements RestaurantItemsRepository {
  final RestaurantItemsRemoteDataSource remoteDataSource;

  RestaurantItemsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, List<RestaurantItemsResponseEntity>>>
  getRestaurantItems() async {
    var either = await remoteDataSource.getRestaurantItems();
    return either.fold(
      (failure) => Left(failure),
      (restaurantItems) => Right(restaurantItems),
    ); 
  }
}
