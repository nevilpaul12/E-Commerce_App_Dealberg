part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState{}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState{}

final class HomeLoadedState extends HomeState{
  
  final List<ProductModel> products;

  HomeLoadedState({required this.products});
  
}

final class HomeLoadedErrorState extends HomeState{}

final class HomeNavigateToCartPage extends HomeActionState{}

final class HomeProductAddToCart extends HomeActionState{}

final class HomeProductAddToCartSnackActionState extends HomeActionState{}
