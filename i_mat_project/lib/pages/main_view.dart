import 'package:flutter/material.dart';
import 'package:i_mat_project/widgets/button_toggle_bar.dart';
import 'package:i_mat_project/widgets/product_grid.dart';
import 'package:i_mat_project/widgets/top_navigation_bar.dart';




class MainView extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Gurka Svensk Klass1',
      'country': 'Sverige',
      'weight': '270 g',
      'price': '18,95 kr',
      'pricePerKg': '70,19 kr/kg',
      'imageUrl': 'https://img.icons8.com/plasticine/100/peas.png'
    },
    {
      'name': 'Paprika Röd Klass1',
      'country': 'Nederländerna',
      'weight': '210 g',
      'price': '11,95 kr',
      'pricePerKg': '56,90 kr/kg',
      'imageUrl': 'https://img.icons8.com/plasticine/100/peas.png'
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

  MainView({super.key});

  @override
Widget build(BuildContext context) {

  return Scaffold(
    
    body: Column(
      children: [
        TopNavigationBar(
          logoAssetPath: 'assets/logo.jpg',
          cartTotal: 123.45,
        ),
        ButtonToggleBar(),
        Expanded(
        child: ProductGrid(
          products: products,
          cardsPerRow: 6,
        ),
      ),
        // The rest of your page
      ],
    ),
  );
}

}

