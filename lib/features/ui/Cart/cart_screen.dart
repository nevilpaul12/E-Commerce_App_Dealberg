import 'package:ecommerce_app/features/bloc/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app/features/repository/data/cart_items.dart';
import 'package:ecommerce_app/features/ui/Cart/cart_tile.dart';
import 'package:ecommerce_app/features/ui/Cart/cart_total.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  double getTotalPrice(){
    double total = 0;
    for(var item in cartItems){
      total += item.price * item.quantity;

    }
    return total;
  }

  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartBloc.add(CartInitialEvent());

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(

          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Cart Items",style: TextStyle(fontFamily: "Phudu",color: Colors.black),),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: BlocConsumer(
          bloc: cartBloc,
          builder: (context,state){
            switch(state.runtimeType){
              case CartSuccessState:
                final successState = state as CartSuccessState;
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: successState.cartItems.length,
                        itemBuilder: (context,index){
                            return CartTile(productModel: successState.cartItems[index], cartBloc: cartBloc);
                      }),
                    ),
                    CartTotal(cartItems: cartItems)
                  ],
                );

                default:
                  return SizedBox();
            }
        }, listener: (context,state){}),
    );
  }
}