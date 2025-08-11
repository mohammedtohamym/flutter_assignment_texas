import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_assets.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/presentation/cubits/cart/cart_cubit.dart';
import 'package:flutter_assignment_texas/presentation/cubits/cart/cart_states.dart';
import 'package:flutter_assignment_texas/domain/entities/restaurant_items_response_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCartOverlay extends StatelessWidget {
  final List<RestaurantItemsResponseEntity> allItems;

  const AppCartOverlay({super.key, required this.allItems});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, cartState) {
        if (!cartState.hasItems) {
          return const SizedBox.shrink();
        }

        final cartCubit = context.read<CartCubit>();
        final totalValue = cartCubit.getTotalCartValue(allItems);

        return Positioned(
          bottom: 10.h, // Position just above the bottom with some padding
          left: 20.w,
          right: 20.w,
          child: GestureDetector(
            onTap: () {
              // Navigate to cart tab
              // You can add navigation logic here
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Container(
                width: double.infinity,
                height: 50.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Rounded rectangle background
                    CustomPaint(
                      size: Size(double.infinity, 50.h),
                      painter: RoundedRectangleSnackBarPainter(
                        fillColor: AppColors.secondaryRed,
                      ),
                    ),
                    // Content
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppAssets.cartBagIcon,
                                width: 25.w,
                                height: 25.h,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'View cart (${cartState.totalItems})',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontFamily: 'SpecialGothicCondensedOne',
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '\$ ${totalValue.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontFamily: 'SpecialGothicCondensedOne',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
      Radius.circular(8.r), // Slightly rounded corners
    );

    // Create small triangle pointing down
    final trianglePath = Path();
    final triangleSize = 8.0.r;
    final triangleTop = center.dy + (rectHeight / 2);

    trianglePath.moveTo(center.dx - triangleSize, triangleTop); // Left point
    trianglePath.lineTo(center.dx + triangleSize, triangleTop); // Right point
    trianglePath.lineTo(center.dx, triangleTop + triangleSize); // Bottom point
    trianglePath.close();

    // Draw filled rounded rectangle
    canvas.drawRRect(rect, paint);

    // Draw filled triangle
    canvas.drawPath(trianglePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
