import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/cubit/main_home_cubit.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/cubit/main_home_states.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/widgets/app_bottom_navigation_bar.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/widgets/app_cart_overlay.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/cubit/menu_cubit.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/cubit/menu_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainHomeCubit(),
      child: BlocBuilder<MainHomeCubit, MainHomeState>(
        builder: (context, state) {
          final cubit = context.read<MainHomeCubit>();
          final currentPage = cubit.getCurrentPage();
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: cubit.cartCubit),
              BlocProvider.value(value: cubit.menuCubit),
            ],
            child: Scaffold(
              backgroundColor: AppColors.body25,
              body: currentPage,
              bottomNavigationBar: const AppBottomNavigationBar(),
              floatingActionButton:
                  cubit.getCurrentIndex() !=
                      2 // Not on cart page
                  ? BlocBuilder<MenuCubit, MenuState>(
                      builder: (context, menuState) {
                        return AppCartOverlay(allItems: menuState.allItems);
                      },
                    )
                  : null,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
            ),
          );
        },
      ),
    );
  }
}
