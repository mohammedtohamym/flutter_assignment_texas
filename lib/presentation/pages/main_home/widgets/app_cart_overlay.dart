import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_assets.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppCartOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void _showHexagonalSnackBar(BuildContext context) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 100.h, // Position above the bottom nav bar
        left: 20.w,
        right: 20.w,
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Container(
                width: 155.w,
                height: 37.h,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    // Rounded rectangle background
                    CustomPaint(
                      size: Size(155.w, 37.h),
                      painter: RoundedRectangleSnackBarPainter(
                        fillColor: AppColors.secondaryRed,
                      ),
                    ),
                    SvgPicture.asset(
                      AppAssets.cartBagIcon,
                      width: 25.w,
                      height: 25.h,
                    ),
                    // Text content
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 5.w), // Add spacing
                        Text(
                          'View cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontFamily: 'SpecialGothicCondensedOne',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Spacer(),
                        Text(
                          '333 BD',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontFamily: 'SpecialGothicCondensedOne',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 10.w),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Remove the snackbar after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      overlayEntry.remove();
    });
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
