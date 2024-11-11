import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_buy_app/core/widgets/product_widget.dart';
import 'package:snap_buy_app/core/widgets/shimmer_product_widget.dart';
import 'package:snap_buy_app/features/home/data/model/product/product_model.dart';
import 'package:snap_buy_app/features/home/logic/products_cubit/products_cubit.dart';
import 'package:snap_buy_app/features/home/logic/products_cubit/products_state.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<ProductsCubit>();
        List<ProductModel> products = cubit.products;
        var hight = MediaQuery.of(context).size.height;

        if (state is ProductsLoading) {
          return SizedBox(
            height: hight * 0.6,
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                crossAxisSpacing: 10.0, // Spacing between columns
                mainAxisSpacing: 10.0, // Spacing between rows
                childAspectRatio: 0.5, // Aspect ratio of each item
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return const ShimmerProductWidget();
              },
            ),
          );
        }
        return SizedBox(
          height: hight * 0.5,
          child: GridView.builder(
            padding: EdgeInsets.all(8.0.sp),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
              crossAxisSpacing: 10.0.sp, // Spacing between columns
              mainAxisSpacing: 10.0.sp, // Spacing between rows
              childAspectRatio: 0.50, // Aspect ratio of each item
            ),
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
