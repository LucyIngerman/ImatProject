import 'package:flutter/material.dart';
import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Gurka Svensk Klass1',
      'country': 'Sverige',
      'weight': '270 g',
      'price': '18,95 kr',
      'pricePerKg': '70,19 kr/kg',
      'imageUrl': 'https://img.icons8.com/plasticine/100/cucumber.png'
    },
    {
      'name': 'Paprika Röd Klass1',
      'country': 'Nederländerna',
      'weight': '210 g',
      'price': '11,95 kr',
      'pricePerKg': '56,90 kr/kg',
      'imageUrl': 'https://img.icons8.com/plasticine/100/red-pepper.png'
    },
    {
      'name': 'Broccoli Klass1',
      'country': 'Nederländerna',
      'weight': '250 g',
      'price': '14,95 kr',
      'pricePerKg': '59,80 kr/kg',
      'imageUrl': 'https://img.icons8.com/plasticine/100/broccoli.png'
    },
    {
      'name': 'Sparris Grön Klass1',
      'country': '',
      'weight': '250 g',
      'price': '47,95 kr',
      'pricePerKg': '191,80 kr/kg',
      'imageUrl': 'https://img.icons8.com/plasticine/100/asparagus.png'
    },
    {
      'name': 'Ärtor Sugarsnap Klass1',
      'country': '',
      'weight': '150 g',
      'price': '39,95 kr',
      'pricePerKg': '266,33 kr/kg',
      'imageUrl': 'https://img.icons8.com/plasticine/100/peas.png'
    },
    {
      'name': 'Morötter Klass1',
      'country': 'Sverige',
      'weight': '2 kg',
      'price': '34,95 kr',
      'pricePerKg': '17,48 kr/kg',
      'imageUrl': 'https://img.icons8.com/plasticine/100/carrot.png'
    },
  ];

  ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280, // fixed height to allow scrolling
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: products.map((product) => ProductCard(product)).toList(),
      ),
    );
  }
}
