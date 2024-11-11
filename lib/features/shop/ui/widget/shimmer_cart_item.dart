import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCartItem extends StatelessWidget {
  const ShimmerCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  height: 20,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 10),
                Container(
                  width: 100,
                  height: 20,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 10),
                Container(
                  width: 80,
                  height: 20,
                  color: Colors.grey[300],
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.delete,
              size: 30,
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }
}
