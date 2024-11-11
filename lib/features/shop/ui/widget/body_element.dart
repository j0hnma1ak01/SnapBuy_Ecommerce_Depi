import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_buy_app/core/routes/routes.dart';
import 'package:snap_buy_app/core/themes/colors_manager.dart';
import 'package:snap_buy_app/core/themes/text_styles.dart';
import 'package:snap_buy_app/core/widgets/custom_app_button.dart';

class BodyElement extends StatelessWidget {
  const BodyElement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .12,
          ),
          Text(
            'Success!',
            style: TextStyles.styleBold(context, fontSize: 32),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            textAlign: TextAlign.center,
            'Your order will be delivered soon. Thank you for choosing our app!',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomAppButton(
            width: 160.w,
            height: 36.h,
            backgroundColor: ColorsManager.redColor,
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, Routes.appLayoutScreen);
            },
            child: const Text('Continue Shopping'),
          ),
        ],
      ),
    );
  }
}
