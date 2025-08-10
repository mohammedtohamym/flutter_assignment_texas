import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/widgets/app_menu_category_bar.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/widgets/app_menu_category_count.dart';
import 'package:flutter_assignment_texas/presentation/pages/main_home/tabs/menu/widgets/app_menu_item_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'EXPLORE MENU',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.r,
                    fontFamily: 'BERNIER',
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.search, size: 32.r),
                  onPressed: () {
                    // Handle search action
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.h),
        const AppMenuCategoryBar(),
        SizedBox(height: 24.h),
        const AppMenuCategoryCount(),
        SizedBox(height: 8.h),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(0),
            itemBuilder: (context, index) {
              return AppMenuItemCard();
            },
            itemCount: 10, // Example number of categories
          ),
        ),
      ],
    );
  }
}
