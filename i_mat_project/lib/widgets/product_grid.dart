import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'product_card.dart'; // Your custom card

class ProductGrid extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final int cardsPerRow;

  const ProductGrid({
    required this.products,
    this.cardsPerRow = 2, // Change this to control layout
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double spacing = 10;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: cardsPerRow,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing * 2, // Increased vertical gap
          childAspectRatio: 0.6, // Adjusted to prevent cards from being too big
        ),
        itemBuilder: (context, index) {
          return ProductCard(
            products[index],
            onAddToCart: () {
              // cart.add(products[index]); // Replace with your cart logic
              if (kDebugMode) {
                print('Added ${products[index]['name']} to cart');
              }
            },
          );
        },
      ),
    );
  }
}
