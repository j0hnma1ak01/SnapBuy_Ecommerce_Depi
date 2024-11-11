import 'package:flutter/material.dart';
import 'package:snap_buy_app/features/home/data/model/product/product_model.dart';
import 'package:snap_buy_app/features/shop/ui/widget/custom_button_bloc_consumer.dart';

import 'payment_methods_list_view.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet(
      {super.key, required this.amount, required this.products});
  final String amount;
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16.0),
          const PaymentMethodsListView(),
          const SizedBox(height: 32.0),
          CustomButtonBlocConsumer(
            amount: amount,
            products: products,
          ),
        ],
      ),
    );
  }
}
