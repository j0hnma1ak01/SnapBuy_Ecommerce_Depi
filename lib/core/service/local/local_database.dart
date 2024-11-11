import 'package:hive/hive.dart';
import 'package:snap_buy_app/core/app_constant.dart';
import 'package:snap_buy_app/core/service/local/boxes.dart';
import 'package:snap_buy_app/features/home/data/model/product/product_model.dart';

class LocalDatabase {
  LocalDatabase._();
  static final onboardingBox = Hive.box(Boxes.onBoardingBox);
  static final loginBox = Hive.box(Boxes.loginBox);

  static final boxFavourite =
      Hive.box<ProductModel>(Boxes.favouriteProductsBox);
  static final boxShopping = Hive.box<ProductModel>(Boxes.shoppingCartBox);
//! onBoarding
  static bool hasUserSeenOnBoarding() {
    return onboardingBox.get(AppConstant.hasUserSeenOnBoarding,
        defaultValue: false);
  }

  static bool hasUserLoggedIn() {
    return loginBox.get(AppConstant.hasUserLoggedIn, defaultValue: false);
  }

  static setUserLoggedIn() {
    loginBox.put(AppConstant.hasUserLoggedIn, true);
  }

  static setUserSeenOnBoarding() {
    onboardingBox.put(AppConstant.hasUserSeenOnBoarding, true);
  }

//! Favourite
  static addProductToFavourite(ProductModel product) {
    boxFavourite.add(product);
  }

  static deleteProductFromFavorite(int index) {
    boxFavourite.deleteAt(index);
  }

  static List<ProductModel> getFavouriteProducts() {
    return boxFavourite.values.toList();
  }

//! Shopping Cart
  static addProductToShoppingCart(ProductModel product) {
    boxShopping.add(product);
  }

  static deleteProductFromShoppingCart(int index) {
    boxShopping.deleteAt(index);
  }

  static deleteAllProductsFromShoppingCart() {
    boxShopping.clear();
  }

  static List<ProductModel> getShoppingCartProducts() {
    return boxShopping.values.toList();
  }
}
