class ProductModel{
  final String id;
 final  String name;
 final  String description;
 final  int price;
 final  String imageUrl;
 int quantity;

  ProductModel({
    required this.id,
    required this.name, 
    required this.description,
    this.quantity = 1,
    required this.price, 
    required this.imageUrl});

}