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
  List<int> _navigationHistory = [0]; // Start with home page

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
    ProfileScreen(mainHomeCubit: this),
    MoreScreen(),
  ];

  void changeTab(int index) {
    final currentState = state as MainHomeTabState;
    final currentIndex = currentState.currentIndex;

    // Only add to history if it's a different tab and not the profile tab
    if (index != currentIndex) {
      if (index == 3) {
        // Profile tab
        // Don't add profile to history, just navigate
      } else {
        // Add current tab to history before changing (if it's not profile)
        if (currentIndex != 3) {
          _addToHistory(currentIndex);
        }
        // Add new tab to history
        _addToHistory(index);
      }
    }

    emit(currentState.copyWith(currentIndex: index));
  }

  void _addToHistory(int index) {
    // Remove if already exists to avoid duplicates
    _navigationHistory.remove(index);
    // Add to end
    _navigationHistory.add(index);
    // Keep only last 5 items for performance
    if (_navigationHistory.length > 5) {
      _navigationHistory.removeAt(0);
    }
  }

  int getPreviousTab() {
    // If we have history and current tab is profile, get the last non-profile tab
    if (_navigationHistory.length >= 2) {
      // Get the second to last item (last item is current, unless we're on profile)
      for (int i = _navigationHistory.length - 1; i >= 0; i--) {
        if (_navigationHistory[i] != 3) {
          // Not profile tab
          return _navigationHistory[i];
        }
      }
    }
    // Default to home if no valid history
    return 0;
  }

  void navigateBack() {
    final previousTab = getPreviousTab();
    changeTab(previousTab);
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
