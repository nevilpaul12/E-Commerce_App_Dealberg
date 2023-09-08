part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent{}

class CartQuantityMinusEvent extends CartEvent{
  final ProductModel productModel;

  CartQuantityMinusEvent(this.productModel);
}

class CartQuantityAddEvent extends CartEvent{

  final ProductModel productModel;

  CartQuantityAddEvent(this.productModel);
}

class CartRemoveFromCartEvent extends CartEvent{

  final ProductModel productModel;

  CartRemoveFromCartEvent(this.productModel);

}
