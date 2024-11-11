import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:snap_buy_app/bloc_observer.dart';
import 'package:snap_buy_app/core/functions/check_if_logged_in_user.dart';
import 'package:snap_buy_app/core/service/local/boxes.dart';
import 'package:snap_buy_app/core/service/remote/api/api_keys.dart';
import 'package:snap_buy_app/features/home/data/model/product/product_model.dart';
import 'package:snap_buy_app/firebase_options.dart';
import 'package:snap_buy_app/snap_buy_app.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

//  firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await checkIfLoggedInUser;
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(ReviewModelAdapter());
  Hive.registerAdapter(MetaAdapter());

  await Hive.openBox(Boxes.onBoardingBox);
  await Hive.openBox(Boxes.loginBox);
  await Hive.openBox<ProductModel>(Boxes.shoppingCartBox);
  await Hive.openBox<ProductModel>(Boxes.favouriteProductsBox);
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const SnapBuyApp());
}
