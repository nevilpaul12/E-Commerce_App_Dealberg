part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class CartSuccessState extends CartState{
  
  final List<ProductModel> cartItems;

  CartSuccessState({required this.cartItems});

}
