import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:snap_buy_app/core/app_constant.dart';
import 'package:snap_buy_app/core/helper/extensions/navigation_extension.dart';
import 'package:snap_buy_app/core/routes/routes.dart';
import 'package:snap_buy_app/core/service/local/local_database.dart';
import 'package:snap_buy_app/features/spalsh/ui/widgets/splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    _startDelay();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  _startDelay() {
    timer = Timer(const Duration(seconds: 6), _goNext);
  }

  _goNext() async {
    if (!mounted) return; // Check if the widget is still mounted
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    if (LocalDatabase.hasUserLoggedIn()) {
      context.pushNamedAndRemoveUntil(Routes.appLayoutScreen,
          predicate: (route) => false);
    } else {
      if (LocalDatabase.hasUserSeenOnBoarding()) {
        log(LocalDatabase.hasUserLoggedIn().toString());
        // i will change this to sign in screen
        context.pushNamedAndRemoveUntil(Routes.registerScreen,
            predicate: (route) => false);
      } else {
        context.pushNamedAndRemoveUntil(Routes.onBoardingScreen,
            predicate: (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
