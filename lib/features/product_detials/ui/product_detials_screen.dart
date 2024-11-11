import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_buy_app/core/themes/text_styles.dart';
import 'package:snap_buy_app/features/home/data/model/product/product_model.dart';
import 'package:snap_buy_app/features/product_detials/ui/widget/cart_section.dart';
import 'package:snap_buy_app/features/product_detials/ui/widget/product_description_section.dart';
import 'package:snap_buy_app/features/product_detials/ui/widget/review_section.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProductDetialsAppBar(product: product),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Title, Price, Rating
                      ProductDescriptionSection(product: product),

                      const SizedBox(height: 8),
                      Text(
                        product.description,
                        style: TextStyles.styleBold(
                          context,
                          fontSize: 16.sp,
                        ),
                      ),

                      const SizedBox(height: 24),
                      CartSection(product: product),
                      const SizedBox(height: 24),
                      ReviewSection(product: product)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetialsAppBar extends StatelessWidget {
  const ProductDetialsAppBar({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300.0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      flexibleSpace: SafeArea(
        child: FlexibleSpaceBar(
          background: CarouselSlider(
            items: product.images
                .map((image) => Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(image, fit: BoxFit.cover)))
                .toList(),
            options: CarouselOptions(
              height: 300,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlay: true,
            ),
          ),
        ),
      ),
    );
  }
}
