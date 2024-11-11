import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snap_buy_app/core/themes/colors_manager.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    this.isActive = false,
    required this.image,
  });
  final bool isActive;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            width: 1.50,
            color: isActive ? ColorsManager.redColor : Colors.grey,
          ),
        ),
        shadows: [
          BoxShadow(
            color: isActive ? ColorsManager.redColor : Colors.white,
            offset: const Offset(0, 0),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: SvgPicture.asset(
          image,
        ),
      ),
    );
  }
}
