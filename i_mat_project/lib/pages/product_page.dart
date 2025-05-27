import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:i_mat_project/providers/cart_provider.dart';
import 'package:i_mat_project/widgets/button_toggle_bar.dart';
import 'package:i_mat_project/widgets/footer.dart';
import 'package:i_mat_project/widgets/product_grid.dart';
import 'package:i_mat_project/widgets/top_navigation_bar.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required category});

  @override
  // ignore: library_private_types_in_public_api
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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
                logoAssetPath: 'assets/logo_2.png',
                cartTotal: cart.totalPrice,
                itemCount: cart.itemCount,
              ),
              ButtonToggleBar(selectedLabel: "Kategorier",),
              Expanded(
                child: products.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ProductGrid(
                        products: products,
                        cardsPerRow: 7,
                      ),
              ),
              Footer(),
            ],
          ),
        ],
      ),
    );
  }
}
