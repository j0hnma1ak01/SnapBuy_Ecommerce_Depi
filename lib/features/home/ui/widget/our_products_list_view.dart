
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_buy_app/core/widgets/product_widget.dart';
import 'package:snap_buy_app/features/home/data/model/product/product_model.dart';
import 'package:snap_buy_app/features/home/logic/products_cubit/products_cubit.dart';
import 'package:snap_buy_app/features/home/logic/products_cubit/products_state.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<ProductsCubit>();
        List<ProductModel> products = cubit.products;
        return SizedBox(
          height: 290.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductWidget(
                product: products[index],
              );
            },
          ),
        );
      },
    );
  }
}
