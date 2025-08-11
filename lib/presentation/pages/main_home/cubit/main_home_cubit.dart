import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/cubit/main_home_states.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/cart/view/cart_screen.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/home/view/home_screen.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/view/menu_screen.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/cubit/menu_cubit.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/more/view/more_screen.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/view/profile_screen.dart';
import 'package:flutter_assignment_texas/presentation/cubits/cart/cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainHomeCubit extends Cubit<MainHomeState> {
  late final MenuCubit _menuCubit;
  late final CartCubit _cartCubit;

  MainHomeCubit() : super(const MainHomeTabState()) {
    _initializeDependencies();
  }

  void _initializeDependencies() {
    // Use GetIt to resolve dependencies - only domain layer abstractions
    _menuCubit = GetIt.instance<MenuCubit>();
    _cartCubit = GetIt.instance<CartCubit>(); // Get cart cubit from DI
  }

  // Expose cart cubit for access by children
  CartCubit get cartCubit => _cartCubit;

  // Expose menu cubit for access by children
  MenuCubit get menuCubit => _menuCubit;

  List<Widget> get pages => [
    HomeScreen(),
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _menuCubit),
        BlocProvider.value(value: _cartCubit),
      ],
      child: MenuScreen(),
    ),
    BlocProvider.value(value: _cartCubit, child: CartScreen()),
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
    // Don't close _cartCubit here since it's a singleton managed by DI
    return super.close();
  }
}
