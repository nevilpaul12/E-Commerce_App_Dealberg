import 'package:ecommerce_app/features/repository/model/product_model.dart';
import 'package:flutter/material.dart';

class CartTotal extends StatelessWidget {

  final List<ProductModel> cartItems;
  const CartTotal({super.key,required this.cartItems});

  @override
   Widget build(BuildContext context) {
    int totalSum = 0;

    // Calculate the total sum of all items in the cart
    for (final item in cartItems) {
      totalSum += item.price * item.quantity;
    }

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 1.0, color: Colors.grey)),
      ),
      child: Text(
        "Total: ₹$totalSum", // Display the total sum here
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}