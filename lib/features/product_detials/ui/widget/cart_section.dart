import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_buy_app/core/functions/show_snak_bar.dart';
import 'package:snap_buy_app/core/helper/extensions/navigation_extension.dart';
import 'package:snap_buy_app/core/themes/colors_manager.dart';
import 'package:snap_buy_app/core/themes/text_styles.dart';
import 'package:snap_buy_app/core/widgets/custom_app_button.dart';
import 'package:snap_buy_app/features/home/data/model/product/product_model.dart';
import 'package:snap_buy_app/features/shop/logic/shop_cubit/shop_cart_cubit.dart';
import 'package:snap_buy_app/features/shop/logic/shop_cubit/shop_cart_state.dart';

class CartSection extends StatelessWidget {
  const CartSection({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCartCubit, ShopCartState>(
      listener: (context, state) {
        if (state is AddToShopCart) {
          showSnakBar(context, 'Add To cart Done!', Colors.green);
          context.read<ShopCartCubit>().getShoppingCartProducts();
          context.read<ShopCartCubit>().quantity = 1;
          context.pop();
        } else if (state is ProductExistsInCart) {
          showSnakBar(context, 'Item Already exist', Colors.red);
          context.read<ShopCartCubit>().quantity = 1;
        }
      },
      builder: (context, state) {
        var cubit = context.read<ShopCartCubit>();
        return Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      cubit.decrementQuantity();
                    },
                  ),
                  Text(
                    cubit.quantity.toString(),
                    style: TextStyles.styleBold(
                      context,
                      fontSize: 18.sp,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      cubit.incrementQuantity();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomAppButton(
                  width: 50,
                  height: 50,
                  onPressed: () {
                    cubit.addProductToShoppingCart(ProductModel(
                      id: product.id,
                      title: product.title,
                      description: product.description,
                      category: product.category,
                      price: product.price,
                      discountPercentage: product.discountPercentage,
                      rating: product.rating,
                      stock: product.stock,
                      brand: product.brand,
                      sku: product.sku,
                      availabilityStatus: product.availabilityStatus,
                      reviews: product.reviews,
                      returnPolicy: product.returnPolicy,
                      meta: product.meta,
                      images: product.images,
                      thumbnail: product.thumbnail,
                      quantity: cubit.quantity,
                    ));
                  },
                  borderRadius: 10,
                  backgroundColor: ColorsManager.redColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add_shopping_cart),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        "Add to Cart",
                        style: TextStyles.styleBold(
                          context,
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        );
      },
    );
  }
}
