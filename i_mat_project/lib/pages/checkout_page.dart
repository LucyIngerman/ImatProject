import 'package:flutter/material.dart';
import 'package:i_mat_project/providers/cart_provider.dart';
import 'package:i_mat_project/widgets/button_toggle_bar.dart';
import 'package:i_mat_project/widgets/top_navigation_bar.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  
  @override
  Widget build(BuildContext context) {
    final GlobalKey topNavKey = GlobalKey();


    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          // Replace AppBar with your custom top_navigation_bar
          TopNavigationBar(
                key: topNavKey,
                logoAssetPath: 'assets/logo.jpg',
                cartTotal: cart.totalPrice,
                itemCount: cart.itemCount,
              ),
              ButtonToggleBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ordersammanfattning',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          title: Text('Artikel 1'),
                          trailing: Text('10,00 kr'),
                        ),
                        ListTile(
                          title: Text('Artikel 2'),
                          trailing: Text('15,00 kr'),
                        ),
                        ListTile(
                          title: Text('Artikel 3'),
                          trailing: Text('20,00 kr'),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Totalt:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '45,00 kr',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Hantera kassalogik
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Beställning genomförd!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Center(
                      child: Text(
                        'Slutför beställning',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}