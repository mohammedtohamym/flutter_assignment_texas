import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_assets.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/domain/entities/restaurant_items_response_entity.dart';
import 'package:flutter_svg/svg.dart';

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
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 134,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  item.imageUrl != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            item.imageUrl!,
                            fit: BoxFit.cover,
                            width: 134,
                            height: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[200],
                                child: Icon(
                                  Icons.fastfood,
                                  size: 48,
                                  color: Colors.grey[400],
                                ),
                              );
                            },
                          ),
                        )
                      : Container(
                          color: Colors.grey[200],
                          child: Icon(
                            Icons.fastfood,
                            size: 48,
                            color: Colors.grey[400],
                          ),
                        ),
                  if (isFavorite)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.secondaryRed,
                          size: 12,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Transform.translate(
                        offset: Offset(0, -4),
                        child: Text(
                          item.itemName ?? 'Unknown Item',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'SpecialGothicCondensedOne',
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );
                        },
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          key: ValueKey(isFavorite),
                          color: isFavorite
                              ? AppColors.secondaryRed
                              : AppColors.black,
                          size: 24,
                        ),
                      ),
                      onPressed: () {
                        // Add haptic feedback for better UX
                        // HapticFeedback.lightImpact();
                        onToggleFavorite();
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: Text(
                    item.itemDescription ?? 'No description available',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'SpecialGothicCondensedOne',
                      color: AppColors.body700,
                    ),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 8),
                AppMenuButton(
                  onPressed: () {
                    // Handle customize action - could navigate to customization page
                  },
                  buttonType: MenuButtonType.customize,
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$${item.itemPrice?.toStringAsFixed(0) ?? '0'}',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'SpecialGothicCondensedOne',
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 16),
                          if ((item.itemPrice ?? 0) >
                              0) // Show discounted price if there's a price
                            Text(
                              '\$${((item.itemPrice ?? 0) * 1.3).toStringAsFixed(0)}',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'SpecialGothicCondensedOne',
                                color: AppColors.body700,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: AppColors.body700,
                                decorationThickness: 0.8,
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    isInCart
                        ? Expanded(
                            child: Row(
                              children: [
                                AppMenuButton(
                                  onPressed: onRemoveFromCart,
                                  buttonType: MenuButtonType.remove,
                                  isMoreThanOne: isMoreThanOne,
                                ),

                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '$cartQuantity',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily:
                                              'SpecialGothicCondensedOne',
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                AppMenuButton(
                                  onPressed: onAddToCart,
                                  buttonType: MenuButtonType.addSmall,
                                ),
                              ],
                            ),
                          )
                        : Expanded(
                            child: AppMenuButton(
                              onPressed: onAddToCart,
                              buttonType: MenuButtonType.addToCart,
                            ),
                          ),
                  ],
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

enum MenuButtonType { addToCart, addSmall, remove, customize }

/// A reusable button widget for menu items that handles different button types.
///
/// Usage examples:
/// - `AppMenuButton(onPressed: () {}, buttonType: MenuButtonType.addToCart)`
/// - `AppMenuButton(onPressed: () {}, buttonType: MenuButtonType.addSmall)`
/// - `AppMenuButton(onPressed: () {}, buttonType: MenuButtonType.remove, isMoreThanOne: true)`
/// - `AppMenuButton(onPressed: () {}, buttonType: MenuButtonType.customize)`
class AppMenuButton extends StatelessWidget {
  final VoidCallback onPressed;
  final MenuButtonType buttonType;
  final bool? isMoreThanOne; // Only needed for remove button
  final int? cartQuantity; // Only needed for quantity display

  const AppMenuButton({
    super.key,
    required this.onPressed,
    required this.buttonType,
    this.isMoreThanOne,
    this.cartQuantity,
  });

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case MenuButtonType.addToCart:
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            minimumSize: Size(140, 40),
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            backgroundColor: AppColors.primaryOrange,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppAssets.addIcon,
                colorFilter: ColorFilter.mode(
                  AppColors.body900,
                  BlendMode.srcIn,
                ),
                width: 12,
                height: 12,
              ),
              SizedBox(width: 4),
              Text(
                'Add to Cart',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'SpecialGothicCondensedOne',
                  color: AppColors.body900,
                ),
              ),
            ],
          ),
        );

      case MenuButtonType.addSmall:
      case MenuButtonType.remove:
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: AppColors.body700.withValues(alpha: 0.2),
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              elevation: 4,
              minimumSize: Size(40, 40),
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              backgroundColor: _getButtonColor(),
            ),
            child: _getButtonChild(),
          ),
        );

      case MenuButtonType.customize:
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            minimumSize: Size(4, 20),
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            backgroundColor: AppColors.transparent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Customize',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'SpecialGothicCondensedOne',
                  color: AppColors.secondaryRed,
                ),
              ),
              SizedBox(width: 4),
              Transform.translate(
                offset: Offset(0, 2),
                child: CircleAvatar(
                  backgroundColor: AppColors.secondaryRed,
                  radius: 8,
                  child: SvgPicture.asset(
                    AppAssets.rightArrowIcon,
                    colorFilter: ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                    width: 8,
                    height: 8,
                  ),
                ),
              ),
            ],
          ),
        );
    }
  }

  Color _getButtonColor() {
    switch (buttonType) {
      case MenuButtonType.addSmall:
        return AppColors.primaryOrange;
      case MenuButtonType.remove:
        return AppColors.body300;
      default:
        return AppColors.primaryOrange;
    }
  }

  Widget _getButtonChild() {
    switch (buttonType) {
      case MenuButtonType.addSmall:
        return SvgPicture.asset(
          AppAssets.addIcon,
          colorFilter: ColorFilter.mode(AppColors.body900, BlendMode.srcIn),
          width: 16,
          height: 16,
        );
      case MenuButtonType.remove:
        return (isMoreThanOne ?? false)
            ? Text(
                '-',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'SpecialGothicCondensedOne',
                  color: AppColors.body900,
                ),
              )
            : SvgPicture.asset(
                AppAssets.trashIcon,
                colorFilter: ColorFilter.mode(
                  AppColors.body900,
                  BlendMode.srcIn,
                ),
                width: 12,
                height: 12,
              );
      default:
        return Container();
    }
  }
}
