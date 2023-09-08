part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class HomeProductCartButtonClickedEvent extends HomeEvent{
  
  final ProductModel clickedProduct;

  HomeProductCartButtonClickedEvent({required this.clickedProduct});
  
}

class HomeCartButtonNavigateEvent extends HomeEvent{}