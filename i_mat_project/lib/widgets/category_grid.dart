import 'package:flutter/material.dart';
import 'package:i_mat_project/widgets/category_card.dart';
import 'package:i_mat_project/pages/product_page.dart';

class CategoryGrid extends StatelessWidget {
  final List<Map<String, dynamic>> categories;
  final int cardsPerRow;

  const CategoryGrid({
    super.key,
    required this.categories,
    required this.cardsPerRow,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: cardsPerRow,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return CategoryCard(
          title: category['name'],
          imageUrl: category['image'], // Pass the image property
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductPage(
                  category: category['name'],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
