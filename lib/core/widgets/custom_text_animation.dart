import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:snap_buy_app/core/themes/colors_manager.dart';
import 'package:snap_buy_app/core/themes/text_styles.dart';

class CustomTextAnimation extends StatelessWidget {
  const CustomTextAnimation({
    super.key,
    required this.text,
    this.textAlign,
    this.colorText,
    this.fontSize,
  });

  final String text;
  final TextAlign? textAlign;
  final Color? colorText;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          text,
          textAlign: textAlign ?? TextAlign.center,
          textStyle: TextStyles.styleBold(context,
              color: colorText ?? ColorsManager.redColor,
              fontSize: fontSize ?? 25),
          speed: const Duration(milliseconds: 150),
        ),
      ],
      totalRepeatCount: 1,
      pause: const Duration(milliseconds: 500),
      displayFullTextOnTap: true,
      stopPauseOnTap: true,
    );
  }
}
