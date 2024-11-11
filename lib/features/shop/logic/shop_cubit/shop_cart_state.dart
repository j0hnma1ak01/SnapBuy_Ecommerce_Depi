abstract class ShopCartState {}

final class ShopCartInitial extends ShopCartState {}

final class ShopCartLoading extends ShopCartState {}

final class AddToShopCart extends ShopCartState {}

final class AddToCartError extends ShopCartState {
  final String message;

  AddToCartError(this.message);
}

final class RemoveFromShopCart extends ShopCartState {}

final class RemoveFromCartError extends ShopCartState {
  final String message;

  RemoveFromCartError(this.message);
}

final class ShopCartLoaded extends ShopCartState {}

final class ShopCartError extends ShopCartState {
  final String message;

  ShopCartError(this.message);
}

final class QuantityChanged extends ShopCartState {}

final class ProductExistsInCart extends ShopCartState {}
