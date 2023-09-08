import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/repository/data/cart_items.dart';
import 'package:ecommerce_app/features/repository/data/e_commerce_items.dart';
import 'package:ecommerce_app/features/repository/model/product_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async{
  
    emit(HomeLoadingState());

    emit(HomeLoadedState(products: ProductItems.productLists.map((e) => ProductModel(
      name: e['name'], 
      id: e['id'],
      description: e['description'], 
      price: e['price'], 
      imageUrl: e['imageUrl'])).toList()));
  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
      cartItems.add(event.clickedProduct);
      print("Added to Cart");
      emit(HomeProductAddToCartSnackActionState());

  }



  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
      print("cart clicked");
      emit(HomeNavigateToCartPage());
  }
}
