import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_assets.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/core/resources/app_strings.dart';
import 'package:flutter_assignment_texas/core/resources/app_text_styles.dart';
import 'package:flutter_assignment_texas/presentation/cubits/cart/cart_cubit.dart';
import 'package:flutter_assignment_texas/presentation/cubits/cart/cart_states.dart';
import 'package:flutter_assignment_texas/domain/entities/restaurant_items_response_entity.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCartOverlay extends StatelessWidget {
  final List<RestaurantItemsResponseEntity> allItems;

  const AppCartOverlay({super.key, required this.allItems});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, cartState) {
        // Only show when cart has items AND showOverlay is true
        if (!cartState.hasItems || !cartState.showOverlay) {
          return const SizedBox.shrink();
        }

        final cartCubit = context.read<CartCubit>();
        final totalValue = cartCubit.getTotalCartValue(allItems);

        return Transform.translate(
          offset: Offset(0, -15), // Adjusted static offset
          child: GestureDetector(
            onTap: () {
              // Navigate to cart tab
              // You can add navigation logic here
            },
            child: Container(
              width: 155,
              height: 37,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Rounded rectangle background
                  CustomPaint(
                    size: Size(152, 50),
                    painter: RoundedRectangleSnackBarPainter(
                      fillColor: AppColors.secondaryRed,
                    ),
                  ),
                  // Content
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          AppAssets.cartBagIcon,
                          width: 24,
                          height: 24,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.viewCart,
                              style: AppTextStyles.body.copyWith(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Spacer(),
                            Text(
                              '\$ ${totalValue.toStringAsFixed(0)}',
                              style: AppTextStyles.body.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// Custom painter for rounded rectangle snackbar
class RoundedRectangleSnackBarPainter extends CustomPainter {
  final Color fillColor;

  RoundedRectangleSnackBarPainter({required this.fillColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final rectWidth = size.width;
    final rectHeight = size.height;

    // Create rounded rectangle for snackbar
    final rect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: center, width: rectWidth, height: rectHeight),
      Radius.circular(8), // Slightly rounded corners
    );

    // Create small triangle pointing down
    final trianglePath = Path();
    final triangleSize = 8.0;
    final triangleTop = center.dy + (rectHeight / 2);

    trianglePath.moveTo(center.dx - triangleSize, triangleTop); // Left point
    trianglePath.lineTo(center.dx + triangleSize, triangleTop); // Right point
    trianglePath.lineTo(
      center.dx,
      triangleTop + triangleSize * 1.8,
    ); // Bottom point
    trianglePath.close();

    // Draw filled rounded rectangle
    canvas.drawRRect(rect, paint);

    // Draw filled triangle
    canvas.drawPath(trianglePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
