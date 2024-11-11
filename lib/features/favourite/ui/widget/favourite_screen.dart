import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:snap_buy_app/core/widgets/custom_appbar.dart';
import 'package:snap_buy_app/core/widgets/custom_text_animation.dart';
import 'package:snap_buy_app/features/home/data/model/product/product_model.dart';
import 'package:snap_buy_app/features/shop/data/repos/checkout_repo_impl.dart';
import 'package:snap_buy_app/features/shop/logic/shop_cubit/payment_cubit.dart';
import 'package:snap_buy_app/features/shop/logic/shop_cubit/shop_cart_cubit.dart';
import 'package:snap_buy_app/features/shop/logic/shop_cubit/shop_cart_state.dart';
import 'package:snap_buy_app/features/shop/ui/widget/calc_money.dart';
import 'package:snap_buy_app/features/shop/ui/widget/shop_list_view.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCartCubit, ShopCartState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<ShopCartCubit>();
        List<ProductModel> products = cubit.products;

        return Column(
          children: [
            const CustomAppBar(title: 'Favourite Cart'),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const CustomTextAnimation(text: 'your favourite items !'),
            ),
            ShopListView(products: products),
            const SizedBox(height: 20),

            // Checkout Button
          ],
        );
      },
    );
  }
}
