import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_text_styles.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/widgets/app_menu_button.dart';

class AppMenuFooter extends StatelessWidget {
  final double price;
  final bool isInCart;
  final int cartQuantity;
  final bool isMoreThanOne;
  final VoidCallback onAddToCart;
  final VoidCallback onRemoveFromCart;

  const AppMenuFooter({
    super.key,
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
              Text('\$${price.toStringAsFixed(0)}', style: AppTextStyles.price()),
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
