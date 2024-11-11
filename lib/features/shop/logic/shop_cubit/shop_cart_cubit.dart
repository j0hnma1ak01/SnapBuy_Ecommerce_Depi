import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_buy_app/features/home/data/model/product/product_model.dart';
import 'package:snap_buy_app/features/shop/data/repos/shop_cart_repo.dart';
import 'package:snap_buy_app/features/shop/logic/shop_cubit/shop_cart_state.dart';

class ShopCartCubit extends Cubit<ShopCartState> {
  ShopCartCubit() : super(ShopCartInitial()) {
    getShoppingCartProducts();
  }

  final ShopCartRepo shopCartRepo = ShopCartRepo();
  List<ProductModel> products = [];

  void addProductToShoppingCart(ProductModel product) async {
    emit(ShopCartLoading());
    try {
      final existingProductIndex = products.indexWhere(
        (p) => p.id == product.id,
      );

      if (existingProductIndex != -1) {
        final existingProduct = products[existingProductIndex];
        if (existingProduct.quantity == product.quantity) {
          emit(ProductExistsInCart());
        } else {
          // Update the product quantity in the cart
          products[existingProductIndex] = product;
          shopCartRepo.addProductToShoppingCart(product);
          emit(AddToShopCart());
        }
      } else {
        // Add the new product to the cart
        products.add(product);
        shopCartRepo.addProductToShoppingCart(product);
        emit(AddToShopCart());
      }
    } catch (e) {
      emit(AddToCartError(e.toString()));
    }
  }

  void removeProductFromShoppingCart(int index) async {
    emit(ShopCartLoading());
    try {
      shopCartRepo.deleteProductFromShoppingCart(index);
      emit(RemoveFromShopCart());
    } catch (e) {
      emit(RemoveFromCartError(e.toString()));
    }
  }

  void removeAllProductFromShoppingCart() async {
    emit(ShopCartLoading());
    try {
      shopCartRepo.deleteAllProductFromShoppingCart();
      emit(RemoveFromShopCart());
    } catch (e) {
      emit(RemoveFromCartError(e.toString()));
    }
  }

  void getShoppingCartProducts() async {
    emit(ShopCartLoading());
    try {
      products = await shopCartRepo.getShoppingCartProducts();
      emit(ShopCartLoaded());
    } catch (e) {
      emit(ShopCartError(e.toString()));
    }
  }

  int quantity = 1;

  void incrementQuantity() {
    quantity++;
    emit(QuantityChanged());
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
      emit(QuantityChanged());
    }
  }
}
