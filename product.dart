class Product {
  final String name;
  final double price;
  bool isInCart;

  Product({required this.name, required this.price, this.isInCart = false});
}
