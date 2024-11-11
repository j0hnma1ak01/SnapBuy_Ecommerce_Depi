import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_buy_app/core/themes/colors_manager.dart';
import 'package:snap_buy_app/core/themes/text_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.categoryName,
      required this.isSelected,
      required this.onTap});

  final String categoryName;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: isSelected ? ColorsManager.redColor : Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                categoryName,
                style: TextStyles.styleBold(
                  context,
                  fontSize: 18.sp,
                  color: isSelected
                      ? ColorsManager.whiteColor
                      : ColorsManager.blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
