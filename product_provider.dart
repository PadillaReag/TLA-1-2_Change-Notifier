import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductController extends ChangeNotifier {
  final List<Product> _products = [
    Product(name: "Game 1", price: 20.0),
    Product(name: "Game 2", price: 15.0),
    Product(name: "Game 3", price: 25.0),
  ];

  List<Product> get products => _products;

  void toggleInCart(Product product) {
    product.isInCart = !product.isInCart;
    notifyListeners();
  }
}

final productProvider = ChangeNotifierProvider((_) => ProductController());
