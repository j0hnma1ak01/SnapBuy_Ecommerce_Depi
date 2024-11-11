import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_buy_app/features/home/data/model/categort/category_model.dart';
import 'package:snap_buy_app/features/home/logic/category_cubit/category_cubit.dart';
import 'package:snap_buy_app/features/home/logic/category_cubit/category_state.dart';
import 'package:snap_buy_app/features/home/logic/products_cubit/products_cubit.dart';
import 'package:snap_buy_app/features/home/ui/widget/category_item.dart';
import 'package:snap_buy_app/features/home/ui/widget/shimmer_category_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<CategoryCubit>();
        List<CategoryModel> categories = cubit.categories;
        if (state is CategoryLoading) {
          return SizedBox(
            height: 70.h,
            child: ListView.builder(
                itemCount: 7,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const ShimmerCategoryItem();
                }),
          );
        }
        return SizedBox(
          height: 70.h,
          child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryItem(
                  categoryName: categories[index].name,
                  isSelected: cubit.selectedIndex == index,
                  onTap: () {
                    cubit.selectCategory(index);
                    context.read<ProductsCubit>().getProducts(
                          'category/${categories[index].slug}',
                        );
                  },
                );
              }),
        );
      },
    );
  }
}
