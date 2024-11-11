import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_buy_app/core/themes/colors_manager.dart';
import 'package:snap_buy_app/core/themes/text_styles.dart';
import 'package:snap_buy_app/core/utils/app_images.dart';
import 'package:snap_buy_app/core/widgets/custom_text_animation.dart';
import 'package:snap_buy_app/features/home/ui/widget/categories_list_view.dart';
import 'package:snap_buy_app/features/home/ui/widget/product_gridview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppImages.homeIamge2,
                  width: double.infinity, fit: BoxFit.cover, height: 300),
              SizedBox(height: 30.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('  All Categories',
                        style: TextStyles.styleBold(context,
                            fontSize: 20.sp, color: ColorsManager.redColor)),
                    SizedBox(height: 15.h),
                    const CategoriesListView(),
                    Row(
                      children: [
                        Text('  Our Products',
                            style: TextStyles.styleBold(context,
                                fontSize: 20, color: ColorsManager.redColor)),
                        const Spacer(),
                        Text('View All',
                            style: TextStyles.styleRegular(context,
                                fontSize: 16, color: ColorsManager.redColor)),
                      ],
                    ),
                    //   const ProductListView(),
                    const ProductGridView(),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 220,
            left: 10,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomTextAnimation(
                text: 'Welcome to SnapBuy,\nbest place to buy your products',
                textAlign: TextAlign.start,
                colorText: ColorsManager.redColor,
                fontSize: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
