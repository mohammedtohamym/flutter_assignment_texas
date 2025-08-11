import 'package:flutter/material.dart';
import 'package:flutter_assignment_texas/core/resources/app_colors.dart';
import 'package:flutter_svg/svg.dart';

class AppProfileNotificationTile extends StatelessWidget {
  final String text;
  final String icon;
  final Color? textColor;
  final bool hasSuffixIcon;
  final bool hasDivider;
  final int count;
  final VoidCallback? onTap;

  const AppProfileNotificationTile({
    super.key,
    required this.text,
    required this.icon,
    this.textColor,
    this.hasSuffixIcon = true,
    this.hasDivider = true,
    this.count = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColors.body25,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 24),
                Stack(
                  children: [
                    SvgPicture.asset(
                      icon,
                      colorFilter: ColorFilter.mode(
                        textColor ?? AppColors.body900,
                        BlendMode.srcIn,
                      ),
                      height: 16,
                    ),
                    if (count > 0)
                      Transform.translate(
                        offset: Offset(8, -4),
                        child: CircleAvatar(
                          backgroundColor: AppColors.primaryOrange,
                          radius: 6,
                          child: Text(
                            '$count',
                            style: TextStyle(
                              color: AppColors.body25,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(width: 8),
                Text(
                  text,
                  style: TextStyle(
                    color: textColor ?? AppColors.body900,
                    fontFamily: 'SpecialGothicCondensedOne',
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                hasSuffixIcon
                    ? Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.body900,
                        size: 12,
                      )
                    : SizedBox.shrink(),
                SizedBox(width: 24),
              ],
            ),
            SizedBox(height: 8),
            Divider(
              color: hasDivider
                  ? AppColors.body900.withValues(alpha: 0.05)
                  : Colors.transparent,
              thickness: 1,
              indent: 24,
              endIndent: 24,
            ),
            SizedBox(height: hasDivider ? 8 : 0),
          ],
        ),
      ),
    );
  }
}
