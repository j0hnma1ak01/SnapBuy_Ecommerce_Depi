import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:snap_buy_app/core/utils/app_animation_images.dart';
import 'package:snap_buy_app/core/widgets/custom_text_animation.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          child: Column(
            children: [
              Lottie.asset(AppAnimationImages.splashAnimation),
              const CustomTextAnimation(
                text: 'Snap Buy,\n Easy Shopping For you',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
