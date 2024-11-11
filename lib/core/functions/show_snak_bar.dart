import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_buy_app/core/themes/text_styles.dart';

void showSnakBar(BuildContext context, String message, Color color) {
  // Clear any existing SnackBars
  ScaffoldMessenger.of(context).clearSnackBars();

  // Show the new SnackBar
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(
        message,
        style: TextStyles.styleBold(
          context,
          fontSize: 16.sp,
          color: Colors.white,
        ),
      ),
    ),
  );
}
