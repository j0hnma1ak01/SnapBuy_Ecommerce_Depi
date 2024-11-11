import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_buy_app/core/functions/show_snak_bar.dart';
import 'package:snap_buy_app/core/helper/extensions/navigation_extension.dart';
import 'package:snap_buy_app/core/routes/routes.dart';
import 'package:snap_buy_app/core/themes/colors_manager.dart';
import 'package:snap_buy_app/core/themes/text_styles.dart';
import 'package:snap_buy_app/features/home/data/model/product/product_model.dart';
import 'package:snap_buy_app/features/shop/logic/shop_cubit/shop_cart_cubit.dart';
import 'package:snap_buy_app/features/shop/logic/shop_cubit/shop_cart_state.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.product, required this.index});

  final ProductModel product;
  final int index;

  @override
  Widget build(BuildContext context) {
    final titleWords = product.title.split(' ');
    final displayTitle = titleWords.length > 1
        ? '${titleWords[0]} ${titleWords[1]}'
        : titleWords[0];

    return InkWell(
      onTap: () {
        context.pushNamed(Routes.productDetailScreen, arguments: product);
      },
      child: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.sp),
                image: DecorationImage(
                    image: CachedNetworkImageProvider(product.thumbnail),
                    fit: BoxFit.fill),
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  displayTitle,
                  overflow: TextOverflow.clip,
                  style: TextStyles.styleBold(context,
                      fontSize: 20.sp, color: ColorsManager.darkColor),
                ),
                Text(
                  'Price: ${product.price}',
                  style: TextStyles.styleSemiBold(context,
                      fontSize: 16.sp, color: ColorsManager.darkColor),
                ),
                Text(
                  'Quantity: ${product.quantity}',
                  style: TextStyles.styleSemiBold(context,
                      fontSize: 16.sp, color: ColorsManager.darkColor),
                ),
              ],
            ),
            const Spacer(),
            BlocConsumer<ShopCartCubit, ShopCartState>(
              listener: (context, state) {
                if (state is RemoveFromShopCart) {
                  showSnakBar(
                      context, 'Item Reomved Done', ColorsManager.darkColor);
                }
              },
              builder: (context, state) {
                var cubit = context.read<ShopCartCubit>();
                return IconButton(
                  icon: Icon(
                    Icons.delete,
                    size: 30.sp,
                    color: ColorsManager.redColor,
                  ),
                  onPressed: () {
                    cubit.removeProductFromShoppingCart(index);
                    cubit.getShoppingCartProducts();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
