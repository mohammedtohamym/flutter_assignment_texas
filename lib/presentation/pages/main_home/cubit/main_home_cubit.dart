import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/cubit/main_home_states.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/cart/view/cart_screen.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/home/view/home_screen.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/view/menu_screen.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/more/view/more_screen.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/profile/view/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainHomeCubit extends Cubit<MainHomeState> {
  MainHomeCubit() : super(const MainHomeTabState());

  final List<Widget> pages = [
    HomeScreen(),
    MenuScreen(),
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
}
