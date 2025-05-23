import 'package:flutter/material.dart';
import 'package:i_mat_project/providers/cart_provider.dart';
import 'package:i_mat_project/widgets/button_toggle_bar.dart';
import 'package:i_mat_project/widgets/top_navigation_bar.dart';
import 'package:provider/provider.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey topNavKey = GlobalKey();

    final cart = Provider.of<CartProvider>(context);
    return Column(
      children: [
        TopNavigationBar(
          key: topNavKey,
          logoAssetPath: 'assets/logo_2.png',
          cartTotal: cart.totalPrice,
          itemCount: cart.itemCount,
        ),
        ButtonToggleBar(selectedLabel: "Hjälp",),
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Help'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(
                    'How can we help you?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'If you have any questions or need assistance, please refer to the following options:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text('Contact Support'),
                    subtitle: Text('Email us at support@example.com'),
                    onTap: () {
                      // Add email functionality here
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.book),
                    title: Text('User Guide'),
                    subtitle: Text('Read the user guide for detailed instructions'),
                    onTap: () {
                      // Navigate to user guide page
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.forum),
                    title: Text('Community Forum'),
                    subtitle: Text('Join the discussion with other users'),
                    onTap: () {
                      // Navigate to community forum
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
