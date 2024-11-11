import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_buy_app/core/themes/text_styles.dart';
import 'package:snap_buy_app/features/home/data/model/product/product_model.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Product Reviews",
          style: TextStyles.styleBold(
            context,
            fontSize: 22.sp,
          ),
        ),
        const SizedBox(height: 16),
        // Rating Summary
        Row(
          children: [
            Text(
              product.rating.toString(),
              style: TextStyles.styleBold(
                context,
                fontSize: 28.sp,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.star,
                color: Colors.orange, size: 32),
            const SizedBox(width: 8),
            Text(
              "from ${product.reviews.length} reviews",
              style: TextStyles.styleBold(
                context,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Review List
        Column(
          children: product.reviews.map((review) {
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                title: Text(
                  review.reviewerName,
                  style: TextStyles.styleBold(
                    context,
                    fontSize: 16.sp,
                  ),
                ),
                subtitle: Text(
                  review.comment,
                  style: TextStyles.styleBold(
                    context,
                    fontSize: 16.sp,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star,
                        color: Colors.orange, size: 16),
                    Text(
                      review.rating.toString(),
                      style: TextStyles.styleBold(
                        context,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
