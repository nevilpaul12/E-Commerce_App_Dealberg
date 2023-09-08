import 'package:ecommerce_app/features/bloc/home/bloc/home_bloc.dart';
import 'package:ecommerce_app/features/ui/Cart/cart_screen.dart';
import 'package:ecommerce_app/features/ui/Home/product_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScrren extends StatefulWidget {
  const HomeScrren({super.key});

  @override
  State<HomeScrren> createState() => _HomeScrrenState();
}

class _HomeScrrenState extends State<HomeScrren> {

  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeBloc.add(HomeInitialEvent());
    
    
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc,HomeState>(

      bloc:homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
      builder: (context,state){
          switch(state.runtimeType){
            case HomeLoadingState:
                return const Center(
                    child: CircularProgressIndicator(),
                );
            case HomeLoadedState:
                final successState =  state as HomeLoadedState;
                return Scaffold(
                  backgroundColor: Colors.grey.shade200,
                  appBar: AppBar(
                    actions: [
                      IconButton(onPressed: (){
                          homeBloc.add(HomeCartButtonNavigateEvent());
                      }, icon: Icon(Icons.shopping_bag_outlined,color: Colors.black,size: 30,))
                    ],
                    centerTitle: true,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: Text("B2B Ecommerce App",style: TextStyle(color: Colors.black,fontFamily: "Phudu",fontWeight: FontWeight.w500),),
                  ),
                  body: ListView.builder(
                    itemCount: successState.products.length,
                    itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.only(top:8,left: 10,right: 10,bottom: 8),
                          child: ProductTile(productModel: successState.products[index], homeBloc: homeBloc),
                        );
                  }),

                );

                case HomeLoadedErrorState:
                    return const Scaffold(
                        body: Text("Error Occured"),
                    );

                default:
                  return SizedBox();
          }
      },
      listener: (context,state){
        if(state is HomeNavigateToCartPage){
          Navigator.push(context, MaterialPageRoute(builder: ((context) => CartScreen())));
        }
        else if(state is HomeProductAddToCartSnackActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:Text("Item Added to Cart"),
            backgroundColor: Colors.indigo,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            duration: Duration(seconds: 2),));
        }
      },
       
    );
  }
}