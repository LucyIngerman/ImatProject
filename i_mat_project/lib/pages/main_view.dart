import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:i_mat_project/providers/cart_provider.dart';
import 'package:i_mat_project/widgets/button_toggle_bar.dart';
import 'package:i_mat_project/widgets/product_grid.dart';
import 'package:i_mat_project/widgets/top_navigation_bar.dart';
import 'package:provider/provider.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Map<String, dynamic>> products = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final String response = await rootBundle.loadString('assets/sortiment_products.json');
    final List<dynamic> data = json.decode(response);

    setState(() {
      products = data.cast<Map<String, dynamic>>();
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey topNavKey = GlobalKey();


    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
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
                child: products.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ProductGrid(
                        products: products,
                        cardsPerRow: 6,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
