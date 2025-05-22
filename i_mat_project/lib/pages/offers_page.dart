import 'package:flutter/material.dart';
import 'package:i_mat_project/providers/cart_provider.dart';
import 'package:i_mat_project/widgets/button_toggle_bar.dart';
import 'package:i_mat_project/widgets/top_navigation_bar.dart';
import 'package:provider/provider.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey topNavKey = GlobalKey();

    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          TopNavigationBar(
            key: topNavKey,
            logoAssetPath: 'assets/logo_2.png',
            cartTotal: cart.totalPrice,
            itemCount: cart.itemCount,
          ),
          ButtonToggleBar(
            selectedLabel: "Erbjudanden",
          ),
          AppBar(
            title: const Text('Offers'),
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            foregroundColor: Theme.of(context).textTheme.titleLarge?.color,
          ),
          Expanded(
            child: Center(
              child: const Text(
                'No offers available.',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}