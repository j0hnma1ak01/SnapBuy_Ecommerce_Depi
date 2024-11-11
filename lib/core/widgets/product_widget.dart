import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_buy_app/core/routes/routes.dart';
import 'package:snap_buy_app/core/themes/colors_manager.dart';
import 'package:snap_buy_app/core/themes/text_styles.dart';
import 'package:snap_buy_app/core/utils/app_images.dart';
import 'package:snap_buy_app/features/home/data/model/product/product_model.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.productDetailScreen,
            arguments: product);
      },
      child: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                product.thumbnail.isNotEmpty
                    ? Container(
                        color: Colors.grey[200],
                        child: CachedNetworkImage(
                          imageUrl: product.thumbnail,
                          width: 190,
                          height: 184.h,
                          fit: BoxFit.fill,
                        ),
                      )
                    : Container(
                        color: ColorsManager.redColor.withOpacity(0.1),
                        child: Image.asset(
                          AppImages.noProductImage,
                          width: 190,
                          height: 184.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                Padding(
                  padding: EdgeInsets.all(5.0.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 148.w,
                        child: Text(product.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.styleRegular(context,
                                color: ColorsManager.greyColor)),
                      ),
                      SizedBox(
                        width: 60.w,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text(product.category,
                              style: TextStyles.styleBold(context,
                                  fontSize: 16.sp)),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 70.w,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Text(
                                '${product.price}\$',
                                style: TextStyles.styleSemiBold(
                                  context,
                                  fontSize: 18.sp,
                                  color: ColorsManager.redColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amberAccent,
                                size: 20.sp,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                product.rating.toString(),
                                style: TextStyles.styleSemiBold(
                                  context,
                                  fontSize: 16.sp,
                                  color: ColorsManager.greyColor,
                                ),
                              ),
                            ],
                          )
                          // Text(
                          //   '22\$',
                          //   style: TextStyles.styleRegular(context,
                          //           fontSize: 18.sp,
                          //           color: ColorsManager.greyColor)
                          //       .copyWith(
                          //     decoration: TextDecoration.lineThrough,
                          //     decorationColor: ColorsManager.greyColor,
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            // Positioned(
            //   top: 130,
            //   right: 0,
            //   child: SizedBox(
            //     height: 60,
            //     width: 60,
            //     child: Card(
            //       elevation: 5,
            //       color: ColorsManager.whiteColor,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(50),
            //       ),
            //       child: IconButton(
            //         onPressed: () {},
            //         icon: const Icon(
            //           Icons.favorite_border,
            //           color: ColorsManager.greyColor,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            Positioned(
              top: 20.h,
              left: 20.w,
              child: Container(
                decoration: BoxDecoration(
                  color: ColorsManager.redColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${product.discountPercentage.toString()} %',
                    style: TextStyles.styleSemiBold(
                      context,
                      fontSize: 12.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
