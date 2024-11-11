import 'package:snap_buy_app/core/service/local/local_database.dart';
import 'package:snap_buy_app/features/home/data/model/product/product_model.dart';

class ShopCartRepo {
  void addProductToShoppingCart(ProductModel product) {
    try {
      LocalDatabase.addProductToShoppingCart(product);
    } catch (e) {
      rethrow;
    }
  }

  void deleteProductFromShoppingCart(int index) {
    try {
      LocalDatabase.deleteProductFromShoppingCart(index);
    } catch (e) {
      rethrow;
    }
  }

  void deleteAllProductFromShoppingCart() {
    try {
      LocalDatabase.deleteAllProductsFromShoppingCart();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductModel>> getShoppingCartProducts() async {
    try {
      return LocalDatabase.getShoppingCartProducts();
    } catch (e) {
      rethrow;
    }
  }
}
