import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppMenuCategoryBar extends StatelessWidget {
  const AppMenuCategoryBar({super.key});

  final bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      // color: Colors.orange,
      child: Row(
        children: [
          SizedBox(width: 16.w),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Handle category selection
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 4.h, bottom: 4.h, right: 16.w),

                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primaryOrange
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(
                        color: AppColors.primaryOrange,
                        width: 1.w,
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16.r,
                          backgroundColor: Colors.white,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 2.h,
                            bottom: 2.h,
                            right: 16.w,
                            left: 8.w,
                          ),
                          child: Text(
                            'Sandwiches',
                            style: TextStyle(
                              fontSize: 18.r,
                              fontFamily: 'SpecialGothicCondensedOne',
                              color: AppColors.body900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
