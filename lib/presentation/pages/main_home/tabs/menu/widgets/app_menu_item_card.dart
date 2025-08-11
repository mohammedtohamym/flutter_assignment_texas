import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_assignment_texas/domain/entities/restaurant_items_response_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: isFavorite
                ? AppColors.secondaryRed.withValues(alpha: 0.1)
                : AppColors.body300.withValues(alpha: 1),
            blurRadius: 6.r,
            spreadRadius: isFavorite ? 1.r : 0.r,
          ),
        ],
      ),
      height: 190.h,
      width: 428.w,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 134.w,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Stack(
                children: [
                  item.imageUrl != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Image.network(
                            item.imageUrl!,
                            fit: BoxFit.cover,
                            width: 134.w,
                            height: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[200],
                                child: Icon(
                                  Icons.fastfood,
                                  size: 48.r,
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
                            size: 48.r,
                            color: Colors.grey[400],
                          ),
                        ),
                  if (isFavorite)
                    Positioned(
                      top: 8.h,
                      right: 8.w,
                      child: Container(
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4.r,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.secondaryRed,
                          size: 12.r,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Transform.translate(
                        offset: Offset(0, -4.h),
                        child: Text(
                          item.itemName ?? 'Unknown Item',
                          style: TextStyle(
                            fontSize: 20.r,
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
                              : Colors.grey,
                          size: 24.r,
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
                Text(
                  item.itemDescription ?? 'No description available',
                  style: TextStyle(
                    fontSize: 16.r,
                    fontFamily: 'SpecialGothicCondensedOne',
                    color: AppColors.body700,
                  ),
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                ElevatedButton(
                  onPressed: () {
                    // Handle customize action - could navigate to customization page
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0.r,
                    minimumSize: Size(4.w, 20.h),
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
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
                          fontSize: 18.r,
                          fontFamily: 'SpecialGothicCondensedOne',
                          color: AppColors.secondaryRed,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Transform.translate(
                        offset: Offset(0, 2.h),
                        child: Icon(
                          Icons.play_circle_filled,
                          size: 20.r,
                          color: AppColors.secondaryRed,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$${item.itemPrice?.toStringAsFixed(2) ?? '0.00'}',
                            style: TextStyle(
                              fontSize: 20.r,
                              fontFamily: 'SpecialGothicCondensedOne',
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          if ((item.itemPrice ?? 0) >
                              0) // Show discounted price if there's a price
                            Text(
                              '\$${((item.itemPrice ?? 0) * 1.3).toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 18.r,
                                fontFamily: 'SpecialGothicCondensedOne',
                                color: AppColors.body700,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    isInCart
                        ? Expanded(
                            child: Row(
                              children: [
                                ElevatedButton(
                                  onPressed: onRemoveFromCart,
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0.r,
                                    minimumSize: Size(40.w, 40.h),
                                    padding: EdgeInsets.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    backgroundColor: AppColors.primaryOrange,
                                  ),
                                  child: isMoreThanOne
                                      ? Text(
                                          '-',
                                          style: TextStyle(
                                            fontSize: 24.r,
                                            fontFamily:
                                                'SpecialGothicCondensedOne',
                                            color: AppColors.body900,
                                          ),
                                        )
                                      : Icon(
                                          Icons.delete_forever_outlined,
                                          color: AppColors.body900,
                                          size: 18.r,
                                        ),
                                ),
                                SizedBox(width: 16.w),
                                Container(
                                  width: 15.w,
                                  child: Text(
                                    '$cartQuantity',
                                    style: TextStyle(
                                      fontSize: 20.r,
                                      fontFamily: 'SpecialGothicCondensedOne',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                ElevatedButton(
                                  onPressed: onAddToCart,
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0.r,
                                    minimumSize: Size(40.w, 40.h),
                                    padding: EdgeInsets.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    backgroundColor: AppColors.primaryOrange,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: AppColors.body900,
                                    size: 24.r,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Expanded(
                            child: ElevatedButton(
                              onPressed: onAddToCart,
                              style: ElevatedButton.styleFrom(
                                elevation: 0.r,
                                minimumSize: Size(140.w, 40.h),
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                backgroundColor: AppColors.primaryOrange,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 20.r,
                                    color: AppColors.body900,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                      fontSize: 20.r,
                                      fontFamily: 'SpecialGothicCondensedOne',
                                      color: AppColors.body900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
        ],
      ),
    );
  }
}
