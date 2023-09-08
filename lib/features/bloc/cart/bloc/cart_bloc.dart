import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/repository/data/cart_items.dart';
import 'package:ecommerce_app/features/repository/model/product_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartQuantityMinusEvent>(cartQuantityMinusEvent);
    on<CartQuantityAddEvent>(cartQuantityAddEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
  
    emit(CartSuccessState(cartItems:cartItems));
  }

  FutureOr<void> cartQuantityMinusEvent(CartQuantityMinusEvent event, Emitter<CartState> emit) {

      final productModel = event.productModel;
      final existingProductIndex = cartItems.indexWhere((item) => item.name == productModel.name);

       if (existingProductIndex != -1) {
      final existingProduct = cartItems[existingProductIndex];

      if (existingProduct.quantity > 1) {
           existingProduct.quantity--;
      } else {
         cartItems.removeAt(existingProductIndex);
     }

       emit(CartSuccessState(cartItems: List.from(cartItems)));
  }
      
          
  
  }

  FutureOr<void> cartQuantityAddEvent(CartQuantityAddEvent event, Emitter<CartState> emit) {
           final productModel = event.productModel;
  final existingProductIndex = cartItems.indexWhere((item) => item.name == productModel.name);

  if (existingProductIndex != -1) {
    final existingProduct = cartItems[existingProductIndex];

    existingProduct.quantity++;

    emit(CartSuccessState(cartItems: List.from(cartItems)));
  }
  }

  FutureOr<void> cartRemoveFromCartEvent(CartRemoveFromCartEvent event, Emitter<CartState> emit) {
  
      final productModel = event.productModel;
      cartItems.removeWhere((item) => item.name == productModel.name);

      emit(CartSuccessState(cartItems: List.from(cartItems)));
  
  
  }
}
