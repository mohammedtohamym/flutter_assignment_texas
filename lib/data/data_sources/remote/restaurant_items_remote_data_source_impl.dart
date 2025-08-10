import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_assignment_texas/core/api/api_endpoints.dart';
import 'package:flutter_assignment_texas/core/api/api_manager.dart';
import 'package:flutter_assignment_texas/core/errors/failures.dart';
import 'package:flutter_assignment_texas/data/model/restaurant_response_dto.dart';
import 'package:flutter_assignment_texas/domain/repositories/data_sources/remote/restaurant_items_remote_data_source.dart';

class RestaurantItemsRemoteDataSourceImpl
    implements RestaurantItemsRemoteDataSource {
  final ApiManager apiManager;

  RestaurantItemsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, List<RestaurantItemsResponseDto>>>
  getRestaurantItems() async {
    try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return Left(NetworkFailure(message: 'No internet connection'));
      }
      final response = await apiManager.getData(
        endpoint: ApiEndpoints.restaurantItemsEndpoint,
      );
      if (response.statusCode == 200) {
        // Parse the response data and return it
        final List<RestaurantItemsResponseDto> items = (response.data as List)
            .map((item) => RestaurantItemsResponseDto.fromJson(item))
            .toList();
        return Right(items);
      } else {
        return Left(
          ServerFailure(
            message:
                response.statusMessage ??
                ' ${response.statusCode} server error',
          ),
        );
      }
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
