import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_buy_app/core/themes/colors_manager.dart';
import 'package:snap_buy_app/core/themes/text_styles.dart';
import 'package:snap_buy_app/core/widgets/custom_app_button.dart';
import 'package:snap_buy_app/core/widgets/custom_appbar.dart';
import 'package:snap_buy_app/features/home/data/model/product/product_model.dart';
import 'package:snap_buy_app/features/shop/data/repos/checkout_repo_impl.dart';
import 'package:snap_buy_app/features/shop/logic/shop_cubit/payment_cubit.dart';
import 'package:snap_buy_app/features/shop/logic/shop_cubit/shop_cart_cubit.dart';
import 'package:snap_buy_app/features/shop/logic/shop_cubit/shop_cart_state.dart';
import 'package:snap_buy_app/features/shop/ui/widget/calc_money.dart';
import 'package:snap_buy_app/features/shop/ui/widget/shop_list_view.dart';

import 'widget/payment_methods_bottom_sheet.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCartCubit, ShopCartState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<ShopCartCubit>();
        List<ProductModel> products = cubit.products;

        // Calculate the total price
        double totalPrice =
            products.fold(0, (sum, product) => sum + product.price);
        double summmery = 15.00;
        summmery += totalPrice;

        return Column(
          children: [
            const CustomAppBar(title: 'Shopping Cart'),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  CalcMoney(
                    text: 'Order :',
                    money: totalPrice.toStringAsFixed(2),
                  ),
                  const CalcMoney(
                    text: 'Delivery :',
                    money: '15',
                  ),
                  CalcMoney(
                    text: 'Total Price :',
                    money: summmery.toStringAsFixed(2),
                  )
                ],
              ),
            ),
            ShopListView(products: products),
            const SizedBox(height: 20),

            // Checkout Button

            CustomAppButton(
              width: 250.w,
              height: 45,
              borderRadius: 10,
              backgroundColor: ColorsManager.redColor,
              child: Text(
                'Checkout',
                style: TextStyles.styleBold(
                  context,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      String val = (summmery * 100).toInt().toString();
                      log(val);
                      return BlocProvider(
                        create: (context) => PaymentCubit(CheckoutRepoImpl()),
                        child: PaymentMethodsBottomSheet(
                          amount: val,
                          products: products,
                        ),
                      );
                    });
              },
            ),
            SizedBox(height: 20.h),
          ],
        );
      },
    );
  }
}
