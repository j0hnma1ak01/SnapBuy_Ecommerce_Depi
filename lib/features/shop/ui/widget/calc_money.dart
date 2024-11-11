import 'package:flutter/material.dart';
import 'package:snap_buy_app/core/themes/colors_manager.dart';
import 'package:snap_buy_app/core/themes/text_styles.dart';

class CalcMoney extends StatelessWidget {
  const CalcMoney({
    super.key,
    required this.text,
    required this.money,
  });
  final String text;
  final String money;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyles.styleBold(context,
              fontSize: 22, color: ColorsManager.redColor),
        ),
        Text(
          '£$money',
          style: TextStyles.styleBold(context,
              fontSize: 22, color: ColorsManager.redColor),
        ),
      ],
    );
  }
}
