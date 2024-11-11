import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_buy_app/core/utils/app_images.dart';
import 'package:snap_buy_app/features/shop/ui/widget/body_element.dart';

class SuccessViewBody extends StatelessWidget {
  const SuccessViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48.w),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.successImage),
        ),
      ),
      child: const BodyElement(),
    );
  }
}

