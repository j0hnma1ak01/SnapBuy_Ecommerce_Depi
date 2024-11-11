import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:snap_buy_app/core/routes/routes.dart';
import 'package:snap_buy_app/core/service/local/local_database.dart';
import 'package:snap_buy_app/core/themes/colors_manager.dart';
import 'package:snap_buy_app/core/themes/text_styles.dart';
import 'package:snap_buy_app/core/utils/app_images.dart';
import 'package:snap_buy_app/core/widgets/custom_app_button.dart';
import 'package:snap_buy_app/features/onboarding/data/model/onboarding_model.dart';
import 'package:snap_buy_app/features/onboarding/ui/widgets/page_view_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static List<OnboardingModel> onBoardingList = [
    OnboardingModel(
        description:
            'Browse a carefully curated selection of products across multiple categories',
        imagePath: AppImages.onboarding1Image),
    OnboardingModel(
        description:
            'Enjoy a seamless and secure shopping experience with our easy-to-use checkout process.',
        imagePath: AppImages.onboarding2Image),
    OnboardingModel(
        description:
            'Unlock special discounts and daily offers available only to our app users.',
        imagePath: AppImages.onboarding3Image)
  ];

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController? controller;
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: 0,
    );
  }

  onsubmit() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.registerScreen,
      (route) => false,
    );
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomAppButton(
                    width: 118,
                    height: 50,
                    onPressed: () {
                      onsubmit();
                      LocalDatabase.setUserSeenOnBoarding();
                    },
                    backgroundColor: ColorsManager.whiteColor,
                    child: Text(
                      'Skip',
                      style: TextStyles.styleBold(
                        context,
                        color: ColorsManager.blackColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              PageViewWidget(
                controller: controller!,
                onboardingList: OnboardingScreen.onBoardingList,
                isLast: isLastPage,
              ),

              SmoothPageIndicator(
                controller: controller!,
                count: OnboardingScreen.onBoardingList.length,
                effect: const ExpandingDotsEffect(
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                  dotColor: Colors.grey,
                  activeDotColor: ColorsManager.redColor,
                  spacing: 5.0,
                  expansionFactor: 2.0,
                  radius: 16.0,
                  strokeWidth: 2.0,
                ),
              ), // your preferred effect
              SizedBox(height: 100.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomAppButton(
                    width: 118,
                    height: 50,
                    onPressed: () {
                      controller!.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                    backgroundColor: ColorsManager.whiteColor,
                    child: Text(
                      'Back',
                      style: TextStyles.styleBold(
                        context,
                        color: ColorsManager.blackColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                  CustomAppButton(
                    width: 118,
                    height: 50,
                    onPressed: () {
                      bool last = controller!.page!.toInt() ==
                          OnboardingScreen.onBoardingList.length - 1;
                      if (last) {
                        onsubmit();
                        LocalDatabase.setUserSeenOnBoarding();
                      } else {
                        controller!.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    backgroundColor: ColorsManager.redColor,
                    child: Text(
                      'Next',
                      style: TextStyles.styleBold(
                        context,
                        color: ColorsManager.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h)
            ],
          ),
        ),
      ),
    );
  }
}
