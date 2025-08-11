import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/core/resources/app_strings.dart';
import 'package:flutter_assignment_texas/domain/entities/restaurant_items_response_entity.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/widgets/app_menu_button.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/widgets/app_menu_item_image.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/widgets/app_menu_item_header.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/widgets/app_menu_item_description.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/widgets/app_menu_footer.dart';

class AppMenuItemCard extends StatelessWidget {
  final RestaurantItemsResponseEntity item;
  final bool isInCart;
  final int cartQuantity;
  final bool isFavorite;
  final VoidCallback onAddToCart;
  final VoidCallback onRemoveFromCart;
  final VoidCallback onToggleFavorite;

  const AppMenuItemCard({
    super.key,
    required this.item,
    required this.isInCart,
    required this.cartQuantity,
    required this.isFavorite,
    required this.onAddToCart,
    required this.onRemoveFromCart,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMoreThanOne = cartQuantity > 1;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: isFavorite
                ? AppColors.secondaryRed.withValues(alpha: 0.1)
                : AppColors.body300.withValues(alpha: 1),
            blurRadius: 6,
            spreadRadius: isFavorite ? 1 : 0,
          ),
        ],
      ),
      height: 190,
      width: 428,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          AppMenuItemImage(imageUrl: item.imageUrl, isFavorite: isFavorite),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4),
                AppMenuItemHeader(
                  title: item.itemName ?? AppStrings.unknownItem,
                  isFavorite: isFavorite,
                  onToggleFavorite: onToggleFavorite,
                ),
                AppMenuItemDescription(
                  description: item.itemDescription ?? AppStrings.noDescription,
                ),
                SizedBox(height: 8),
                AppMenuButton(
                  onPressed: () {},
                  buttonType: MenuButtonType.customize,
                ),
                SizedBox(height: 4),
                AppMenuFooter(
                  price: item.itemPrice ?? 0,
                  isInCart: isInCart,
                  cartQuantity: cartQuantity,
                  isMoreThanOne: isMoreThanOne,
                  onAddToCart: onAddToCart,
                  onRemoveFromCart: onRemoveFromCart,
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}
