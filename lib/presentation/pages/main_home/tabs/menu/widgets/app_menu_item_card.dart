import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppMenuItemCard extends StatelessWidget {
  const AppMenuItemCard({super.key});

  final int counter = 1;
  final bool isMoreThanOne = true;
  final bool isAdded = true;
  final bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.body300.withValues(alpha: 1),
            blurRadius: 6.r,
            // offset: Offset(0, 2.h),
          ),
        ],
      ),
      height: 194.h,
      width: 428.w,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              // Handle tap on image
            },
            child: Container(
              width: 134.w,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8.r),
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
                          'Crunchy Jalapeno Sandwich',
                          style: TextStyle(
                            fontSize: 20.r,
                            fontFamily: 'SpecialGothicCondensedOne',
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    IconButton(
                      // icon: Icon(Icons.favorite_border),
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite
                            ? AppColors.secondaryRed
                            : Colors.grey,
                        size: 24.r,
                      ),
                      onPressed: () {
                        // Handle favorite action
                      },
                    ),
                  ],
                ),
                Text(
                  'Sandwich prepared and cooked to the highest standards',
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
                    // Handle add to cart action
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0.r,
                    minimumSize: Size(4.w, 20.h),
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        4.r,
                      ), // Change border radius here
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
                            '\$9.99',
                            style: TextStyle(
                              fontSize: 20.r,
                              fontFamily: 'SpecialGothicCondensedOne',
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 24.w),
                          Text(
                            '\$12.99',
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
                    isAdded
                        ? Expanded(
                            child: Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Handle add to cart action
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0.r,
                                    minimumSize: Size(40.w, 40.h),
                                    padding: EdgeInsets.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        4.r,
                                      ), // Change border radius here
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
                                Text(
                                  '$counter',
                                  style: TextStyle(
                                    fontSize: 20.r,
                                    fontFamily: 'SpecialGothicCondensedOne',
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                ElevatedButton(
                                  onPressed: () {
                                    // Handle add to cart action
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0.r,
                                    minimumSize: Size(40.w, 40.h),
                                    padding: EdgeInsets.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        4.r,
                                      ), // Change border radius here
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
                              onPressed: () {
                                // Handle add to cart action
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0.r,
                                minimumSize: Size(140.w, 40.h),
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    4.r,
                                  ), // Change border radius here
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
