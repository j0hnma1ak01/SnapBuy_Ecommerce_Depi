import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_buy_app/core/routes/app_routes.dart';
import 'package:snap_buy_app/core/routes/routes.dart';
import 'package:snap_buy_app/core/themes/colors_manager.dart';
import 'package:snap_buy_app/features/home/logic/category_cubit/category_cubit.dart';
import 'package:snap_buy_app/features/home/logic/products_cubit/products_cubit.dart';
import 'package:snap_buy_app/features/shop/logic/shop_cubit/shop_cart_cubit.dart';

class SnapBuyApp extends StatelessWidget {
  const SnapBuyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRoutes appRoutes = AppRoutes();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CategoryCubit()),
          BlocProvider(create: (context) => ProductsCubit()),
          BlocProvider(create: (context) => ShopCartCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SnapBuy',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: ColorsManager.primaryColor),
            useMaterial3: true,
          ),

          // home: LoginScreen(),
          initialRoute: Routes.splashScreen,
          onGenerateRoute: appRoutes.onGenerateRoute,
        ),
      ),
    );
  }
}
