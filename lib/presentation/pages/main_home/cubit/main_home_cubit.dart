import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/api/api_manager.dart';
import 'package:flutter_assignment_texas/data/data_sources/remote/restaurant_items_remote_data_source_impl.dart';
import 'package:flutter_assignment_texas/data/repositories/restaurant_items_repository_impl.dart';
import 'package:flutter_assignment_texas/domain/use_cases/get_restaurant_items_use_case.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/cubit/main_home_states.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/cart/view/cart_screen.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/home/view/home_screen.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/view/menu_screen.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/cubit/menu_cubit.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/more/view/more_screen.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/view/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainHomeCubit extends Cubit<MainHomeState> {
  late final MenuCubit _menuCubit;

  MainHomeCubit() : super(const MainHomeTabState()) {
    _initializeDependencies();
  }

  void _initializeDependencies() {
    // Setup dependencies
    final apiManager = ApiManager();
    final remoteDataSource = RestaurantItemsRemoteDataSourceImpl(
      apiManager: apiManager,
    );
    final repository = RestaurantItemsRepositoryImpl(
      remoteDataSource: remoteDataSource,
    );
    final getRestaurantItemsUseCase = GetRestaurantItemsUseCase(repository);
    _menuCubit = MenuCubit(
      getRestaurantItemsUseCase: getRestaurantItemsUseCase,
    );
  }

  List<Widget> get pages => [
    HomeScreen(),
    BlocProvider.value(value: _menuCubit, child: MenuScreen()),
    CartScreen(),
    ProfileScreen(),
    MoreScreen(),
  ];

  void changeTab(int index) {
    final currentState = state as MainHomeTabState;
    emit(currentState.copyWith(currentIndex: index));
  }

  int getCurrentIndex() {
    if (state is MainHomeTabState) {
      return (state as MainHomeTabState).currentIndex;
    }
    return 0;
  }

  Widget getCurrentPage() {
    final index = getCurrentIndex();
    return pages[index];
  }

  @override
  Future<void> close() {
    _menuCubit.close();
    return super.close();
  }
}
