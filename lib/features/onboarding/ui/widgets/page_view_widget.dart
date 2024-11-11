import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_buy_app/core/themes/colors_manager.dart';
import 'package:snap_buy_app/core/themes/text_styles.dart';
import 'package:snap_buy_app/features/onboarding/data/model/onboarding_model.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({
    super.key,
    required this.onboardingList,
    required this.controller,
    required this.isLast,
  });

  final List<OnboardingModel> onboardingList;
  final PageController controller;
  final bool isLast;

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  late bool isLast;

  @override
  void initState() {
    super.initState();
    isLast = widget.isLast;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: widget.controller,
        itemCount: widget.onboardingList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset(
                widget.onboardingList[index].imagePath,
                width: 400.w,
                height: 320.h,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 30.h),
              SizedBox(
                child: Text(
                  widget.onboardingList[index].description,
                  textAlign: TextAlign.center,
                  style: TextStyles.styleBold(
                    context,
                    color: ColorsManager.darkColor,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ],
          );
        },
        onPageChanged: (value) {
          if (value == widget.onboardingList.length - 1) {
            setState(() {
              isLast = true;
            });
          } else {
            setState(() {
              isLast = false;
            });
          }
        },
      ),
    );
  }
}