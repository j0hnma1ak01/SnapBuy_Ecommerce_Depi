import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snap_buy_app/core/themes/colors_manager.dart';
import 'package:snap_buy_app/features/app_layout/logic/cubit/app_lyout_cubit.dart';

class IconBottonBar extends StatelessWidget {
  const IconBottonBar({
    super.key,
    required this.cubit,
    required this.iconName,
    required this.index,
  });

  final AppLayoutCubit cubit;
  final String iconName;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconName,
      colorFilter: ColorFilter.mode(
          cubit.currentIndex == index
              ? ColorsManager.primaryColor
              : Colors.grey,
          BlendMode.srcIn),
    );
  }
}
