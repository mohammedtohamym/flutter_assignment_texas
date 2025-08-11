import 'package:get_it/get_it.dart';
import 'package:flutter_assignment_texas/core/api/api_manager.dart';
import 'package:flutter_assignment_texas/domain/repositories/data_sources/remote/restaurant_items_remote_data_source.dart';
import 'package:flutter_assignment_texas/data/data_sources/remote/restaurant_items_remote_data_source_impl.dart';
import 'package:flutter_assignment_texas/data/repositories/restaurant_items_repository_impl.dart';
import 'package:flutter_assignment_texas/domain/repositories/restaurant_items_repository.dart';
import 'package:flutter_assignment_texas/domain/use_cases/get_restaurant_items_use_case.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/cubit/menu_cubit.dart';
import 'package:flutter_assignment_texas/presentation/cubits/cart/cart_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // Core
  getIt.registerLazySingleton<ApiManager>(() => ApiManager());

  // Data Sources
  getIt.registerLazySingleton<RestaurantItemsRemoteDataSource>(
    () => RestaurantItemsRemoteDataSourceImpl(apiManager: getIt<ApiManager>()),
  );

  // Repositories
  getIt.registerLazySingleton<RestaurantItemsRepository>(
    () => RestaurantItemsRepositoryImpl(
      remoteDataSource: getIt<RestaurantItemsRemoteDataSource>(),
    ),
  );

  // Use Cases
  getIt.registerLazySingleton<GetRestaurantItemsUseCase>(
    () => GetRestaurantItemsUseCase(getIt<RestaurantItemsRepository>()),
  );

  // Cubits - Register as factory so each screen gets a new instance
  getIt.registerFactory<MenuCubit>(
    () => MenuCubit(
      getRestaurantItemsUseCase: getIt<GetRestaurantItemsUseCase>(),
    ),
  );

  // Register CartCubit as singleton since cart state should be shared across the app
  getIt.registerLazySingleton<CartCubit>(() => CartCubit());
}
