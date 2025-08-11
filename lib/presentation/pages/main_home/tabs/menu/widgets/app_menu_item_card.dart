import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/core/resources/app_strings.dart';
import 'package:flutter_assignment_texas/core/resources/app_text_styles.dart';
import 'package:flutter_assignment_texas/domain/entities/restaurant_items_response_entity.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/widgets/app_menu_button.dart';

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
          _MenuItemImage(imageUrl: item.imageUrl, isFavorite: isFavorite),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4),
                _MenuItemHeader(
                  title: item.itemName ?? AppStrings.unknownItem,
                  isFavorite: isFavorite,
                  onToggleFavorite: onToggleFavorite,
                ),
                _MenuItemDescription(
                  description: item.itemDescription ?? AppStrings.noDescription,
                ),
                SizedBox(height: 8),
                AppMenuButton(
                  onPressed: () {},
                  buttonType: MenuButtonType.customize,
                ),
                SizedBox(height: 4),
                _MenuFooter(
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

class _MenuItemImage extends StatelessWidget {
  final String? imageUrl;
  final bool isFavorite;

  const _MenuItemImage({required this.imageUrl, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 134,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            if (imageUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                  width: 134,
                  height: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return _placeholder();
                  },
                ),
              )
            else
              _placeholder(),
            if (isFavorite) _favoriteBadge(),
          ],
        ),
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      color: Colors.grey[200],
      child: Icon(Icons.fastfood, size: 48, color: Colors.grey[400]),
    );
  }

  Widget _favoriteBadge() {
    return Positioned(
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
        child: Icon(Icons.favorite, color: AppColors.secondaryRed, size: 12),
      ),
    );
  }
}

class _MenuItemHeader extends StatelessWidget {
  final String title;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const _MenuItemHeader({
    required this.title,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Transform.translate(
            offset: Offset(0, -4),
            child: Text(
              title,
              style: AppTextStyles.body.copyWith(fontSize: 20),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        IconButton(
          icon: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (child, animation) =>
                ScaleTransition(scale: animation, child: child),
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              key: ValueKey(isFavorite),
              color: isFavorite ? AppColors.secondaryRed : AppColors.black,
              size: 24,
            ),
          ),
          onPressed: onToggleFavorite,
        ),
      ],
    );
  }
}

class _MenuItemDescription extends StatelessWidget {
  final String description;
  const _MenuItemDescription({required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Text(
        description,
        style: AppTextStyles.bodyMuted,
        softWrap: true,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _MenuFooter extends StatelessWidget {
  final double price;
  final bool isInCart;
  final int cartQuantity;
  final bool isMoreThanOne;
  final VoidCallback onAddToCart;
  final VoidCallback onRemoveFromCart;

  const _MenuFooter({
    required this.price,
    required this.isInCart,
    required this.cartQuantity,
    required this.isMoreThanOne,
    required this.onAddToCart,
    required this.onRemoveFromCart,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${price.toStringAsFixed(0)}',
                style: AppTextStyles.price(),
              ),
              SizedBox(width: 16),
              if (price > 0)
                Text(
                  '\$${(price * 1.3).toStringAsFixed(0)}',
                  style: AppTextStyles.price(muted: true),
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
                            style: AppTextStyles.body.copyWith(
                              fontSize: 20,
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
    );
  }
}
