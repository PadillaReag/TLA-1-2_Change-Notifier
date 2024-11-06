import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/product_provider.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productController = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: productController.products.length,
        itemBuilder: (context, index) {
          final product = productController.products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
            trailing: IconButton(
              icon: Icon(
                product.isInCart
                    ? Icons.shopping_cart
                    : Icons.shopping_cart_outlined,
                color: product.isInCart ? Colors.green : null,
              ),
              onPressed: () => productController.toggleInCart(product),
            ),
          );
        },
      ),
    );
  }
}
