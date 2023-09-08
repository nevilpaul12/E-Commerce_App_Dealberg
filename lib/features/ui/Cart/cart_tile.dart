import 'package:ecommerce_app/features/bloc/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app/features/repository/model/product_model.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  final ProductModel productModel;
  final CartBloc cartBloc;
  const CartTile({Key? key, required this.productModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(productModel.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  Text(
                    productModel.name.toUpperCase(), 
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 16.0, 
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "₹${productModel.price.toString()}", 
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 16.0, 
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    cartBloc.add(CartQuantityMinusEvent(productModel));
                  },
                  icon: Icon(Icons.remove),
                ),
                Text(
                  productModel.quantity.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // Make the text bold
                    fontSize: 16.0, // Adjust font size as needed
                  ),
                ),
                IconButton(
                  onPressed: () {
                    cartBloc.add(CartQuantityAddEvent(productModel));
                  },
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () {
                    cartBloc.add(CartRemoveFromCartEvent(productModel));
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
