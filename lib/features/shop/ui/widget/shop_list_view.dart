import 'package:flutter/material.dart';
import 'package:snap_buy_app/features/home/data/model/product/product_model.dart';
import 'package:snap_buy_app/features/shop/ui/widget/cart_item.dart';

class ShopListView extends StatelessWidget {
  const ShopListView({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return CartItem(
              product: products[index],
              index: index,
            );
          }),
    );
  }
}
