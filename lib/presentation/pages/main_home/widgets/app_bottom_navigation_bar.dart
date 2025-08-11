import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/cubit/main_home_cubit.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/cubit/main_home_states.dart';
import 'package:flutter_assignment_texas/presentation/cubits/cart/cart_cubit.dart';
import 'package:flutter_assignment_texas/presentation/cubits/cart/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainHomeCubit, MainHomeState>(
      builder: (context, state) {
        final cubit = context.read<MainHomeCubit>();
        final currentIndex = cubit.getCurrentIndex();

        return BlocBuilder<CartCubit, CartState>(
          builder: (context, cartState) {
            // Wrapped with Theme to minimize splash (wave) effect size on tap
            return Theme(
              data: Theme.of(context).copyWith(
                splashFactory:
                    NoSplash.splashFactory, // Remove default large ripple
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                selectedLabelStyle: TextStyle(
                  fontFamily: 'SpecialGothicCondensedOne',
                  fontSize: 14,
                  color: AppColors.body900,
                ),
                unselectedLabelStyle: TextStyle(
                  fontFamily: 'SpecialGothicCondensedOne',
                  fontSize: 12,
                  color: AppColors.body900,
                ),
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                selectedItemColor: AppColors.body900,
                unselectedItemColor: AppColors.body900,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icons/home_icon.svg',
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        currentIndex == 0
                            ? AppColors.primaryOrange
                            : AppColors.body900,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icons/menu_icon.svg',
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        currentIndex == 1
                            ? AppColors.primaryOrange
                            : AppColors.body900,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Menu',
                  ),
                  BottomNavigationBarItem(
                    icon: Transform.scale(
                      scale: 1.6,
                      child: Transform.translate(
                        offset: Offset(0, 4),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.primaryOrange,
                              radius: 20,
                            ),
                            SvgPicture.asset(
                              AppAssets.texasLogoIcon,
                              width: 28,
                              height: 28,
                            ),
                            // Cart badge
                            if (cartState.hasItems)
                              Positioned(
                                top: -6,
                                left: -6,
                                child: Container(
                                  // padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    cartState.totalItems.toString(),
                                    style: TextStyle(
                                      color: AppColors.body900,
                                      fontSize: 18,
                                      fontFamily: 'SpecialGothicCondensedOne',
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    label: '', // Empty label - no text will show
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AppAssets.profileIcon,
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        currentIndex == 3
                            ? AppColors.primaryOrange
                            : AppColors.body900,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Profile',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child: SvgPicture.asset(
                        AppAssets.moreIcon,
                        width: 8,
                        height: 8,
                        colorFilter: ColorFilter.mode(
                          currentIndex == 4
                              ? AppColors.primaryOrange
                              : AppColors.body900,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    label: 'More',
                  ),
                ],
                currentIndex: currentIndex,
                onTap: (index) {
                  cubit.changeTab(index);
                },
              ),
            );
          },
        );
      },
    );
  }
}
