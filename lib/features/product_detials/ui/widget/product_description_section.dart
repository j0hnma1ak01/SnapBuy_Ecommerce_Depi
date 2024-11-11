import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_buy_app/core/themes/colors_manager.dart';
import 'package:snap_buy_app/core/themes/text_styles.dart';
import 'package:snap_buy_app/features/home/data/model/product/product_model.dart';
import 'package:snap_buy_app/features/shop/logic/shop_cubit/shop_cart_cubit.dart';
import 'package:snap_buy_app/features/shop/logic/shop_cubit/shop_cart_state.dart';

class ProductDescriptionSection extends StatefulWidget {
  const ProductDescriptionSection({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  State<ProductDescriptionSection> createState() =>
      _ProductDescriptionSectionState();
}

class _ProductDescriptionSectionState extends State<ProductDescriptionSection> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCartCubit(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            padding: const EdgeInsets.only(left: 12),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              widget.product.title,
              style: TextStyles.styleBold(
                context,
                color: ColorsManager.redColor,
                fontSize: 24.sp,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                '£${widget.product.price}',
                style: TextStyles.styleBold(
                  context,
                  fontSize: 22.sp,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '£${(widget.product.price * (1 - widget.product.discountPercentage / 100)).toStringAsFixed(2)}',
                style: TextStyles.styleBold(
                  context,
                  fontSize: 20.sp,
                  color: ColorsManager.redColor,
                ),
              ),
              const Spacer(),
              const Icon(Icons.star, color: Colors.orange, size: 25),
              SizedBox(width: 4.w),
              Text(widget.product.rating.toString(),
                  style: TextStyles.styleBold(
                    context,
                    fontSize: 18.sp,
                  )),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Stock: ${widget.product.stock}',
                style: TextStyles.styleBold(
                  context,
                  fontSize: 18.sp,
                  color: Colors.grey,
                ),
              ),
              BlocConsumer<ShopCartCubit, ShopCartState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubit = context.read<ShopCartCubit>();
                  return IconButton(
                    onPressed: () {
                      if (!isFavourite) {
                        cubit.addProductToShoppingCart(
                          ProductModel(
                            id: widget.product.id,
                            title: widget.product.title,
                            description: widget.product.description,
                            category: widget.product.category,
                            price: widget.product.price,
                            discountPercentage:
                                widget.product.discountPercentage,
                            rating: widget.product.rating,
                            stock: widget.product.stock,
                            brand: widget.product.brand,
                            sku: widget.product.sku,
                            availabilityStatus:
                                widget.product.availabilityStatus,
                            reviews: widget.product.reviews,
                            returnPolicy: widget.product.returnPolicy,
                            meta: widget.product.meta,
                            images: widget.product.images,
                            thumbnail: widget.product.thumbnail,
                            quantity: cubit.quantity,
                          ),
                        );
                        isFavourite = true;
                        cubit.getShoppingCartProducts();
                      } else {
                        cubit.removeProductFromShoppingCart(widget.product.id);
                        cubit.getShoppingCartProducts();
                        isFavourite = false;
                      }
                      setState(() {});
                    },
                    icon: isFavourite
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 32,
                          )
                        : const Icon(
                            Icons.favorite_border,
                            color: Colors.grey,
                            size: 32,
                          ),
                  );
                },
              )
            ],
          ),
          const SizedBox(height: 16),
          // Description
          Text("Description",
              style: TextStyles.styleBold(
                context,
                fontSize: 22.sp,
              )),
        ],
      ),
    );
  }
}
