import 'package:ecommerce_app/features/bloc/home/bloc/home_bloc.dart';
import 'package:ecommerce_app/features/repository/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {

  final ProductModel productModel;
  final HomeBloc homeBloc;
  const ProductTile({super.key, required this.productModel,required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        
        width: double.infinity,
        child: Row(
          children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(8),topLeft: Radius.circular(8)),
                  image: DecorationImage(image: NetworkImage(productModel.imageUrl),fit: BoxFit.cover)
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(8))
                      ),
                      width: 210,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30,),
                          Text(productModel.name.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text(productModel.description,maxLines: 2,)
                        ],
                      ),
                    ),
                    Row(
                      
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("₹ ${productModel.price.toString()}"),
                        SizedBox(width: 80,),
                        IconButton(onPressed: (){
                              homeBloc.add(HomeProductCartButtonClickedEvent(clickedProduct: productModel));
                              print("${productModel} is clicked");
                        }, icon: Icon(Icons.shopping_cart))
                      ],
                    )
                  ],
                ),
              )
          ],
        ),
        
      ),
    );
  }
}