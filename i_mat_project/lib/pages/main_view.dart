import 'package:flutter/material.dart';
import 'package:i_mat_project/providers/cart_provider.dart';
import 'package:i_mat_project/widgets/button_toggle_bar.dart';
import 'package:i_mat_project/widgets/product_grid.dart';
import 'package:i_mat_project/widgets/top_navigation_bar.dart';
import 'package:provider/provider.dart';




class MainView extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
  {
    'id': 1,
    'name': 'Gurka Svensk Klass1',
    'country': 'Sverige',
    'weight': '270 g',
    'price': '18,95 kr',
    'pricePerKg': '70,19 kr/kg',
    'imageUrl': 'https://img.icons8.com/plasticine/100/peas.png'
  },
  {
    'id': 2,
    'name': 'Paprika Röd Klass1',
    'country': 'Nederländerna',
    'weight': '210 g',
    'price': '11,95 kr',
    'pricePerKg': '56,90 kr/kg',
    'imageUrl': 'https://img.icons8.com/plasticine/100/peas.png'
  },
  {
    'id': 3,
    'name': 'Broccoli Klass1',
    'country': 'Nederländerna',
    'weight': '250 g',
    'price': '14,95 kr',
    'pricePerKg': '59,80 kr/kg',
    'imageUrl': 'https://img.icons8.com/plasticine/100/broccoli.png'
  },
  {
    'id': 4,
    'name': 'Sparris Grön Klass1',
    'country': '',
    'weight': '250 g',
    'price': '47,95 kr',
    'pricePerKg': '191,80 kr/kg',
    'imageUrl': 'https://img.icons8.com/plasticine/100/asparagus.png'
  },
  {
    'id': 5,
    'name': 'Ärtor Sugarsnap Klass1',
    'country': '',
    'weight': '150 g',
    'price': '39,95 kr',
    'pricePerKg': '266,33 kr/kg',
    'imageUrl': 'https://img.icons8.com/plasticine/100/peas.png'
  },
  {
    'id': 6,
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
  final GlobalKey<_TopNavigationBarState> topNavKey = GlobalKey();

  final cart = Provider.of<CartProvider>(context);

  return Scaffold(
    body: Stack(
      children: [
        // Main content
        Column(
          children: [
            TopNavigationBar(
              key: topNavKey,
              logoAssetPath: 'assets/logo.jpg',
              cartTotal: cart.totalPrice,
              itemCount: cart.itemCount,
            ),
            ButtonToggleBar(),
            Expanded(
              child: ProductGrid(
                products: products,
                cardsPerRow: 6,
              ),
            ),
          ],
        ),

        // Optional: if your cart sidebar is in TopNavigationBar,
        // this ensures it renders ABOVE this layout.
        // Otherwise, use OverlayEntry instead for a more global cart.
      ],
    ),
  );
}
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  }
