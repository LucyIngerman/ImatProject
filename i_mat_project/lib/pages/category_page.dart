import 'package:flutter/material.dart';
import 'package:i_mat_project/providers/cart_provider.dart';
import 'package:i_mat_project/widgets/button_toggle_bar.dart';
import 'package:i_mat_project/widgets/category_grid.dart';
import 'package:i_mat_project/widgets/footer.dart';
import 'package:i_mat_project/widgets/top_navigation_bar.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Map<String, dynamic>> products = [
    {"name": "Frukt & Grönt", "image": "assets/category_images/frukt_o_gront.png"},
    {"name": "Mejeri", "image": "assets/category_images/mejeri.png"},
    {"name": "Kött & Chark", "image": "assets/category_images/kott_o_chark.png"},
    {"name": "Bröd", "image": "assets/category_images/brod.png"},
    {"name": "Fisk & Skaldjur", "image": "assets/category_images/fisk_o_skaldjur.png"},
    {"name": "Ost", "image": "assets/category_images/ost.png"},
    {"name": "Godis & Snacks", "image": "assets/category_images/godis_o_snacks.png"},

  ];

  @override
  void initState() {
    super.initState();
    // loadProducts();
  }

  // Future<void> loadProducts() async {
  //   final String response = await rootBundle.loadString('assets/sortiment_products.json');
  //   final List<dynamic> data = json.decode(response);

  //   setState(() {
  //     products = data.cast<Map<String, dynamic>>();
  //   });
  // }

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
                    : CategoryGrid(
                        categories: products,
                        cardsPerRow: 6,
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
