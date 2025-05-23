import 'package:flutter/material.dart';

class CartSidebar extends StatelessWidget {
  final VoidCallback onClose;

  const CartSidebar({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: Icon(Icons.close),
            onPressed: onClose,
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Text('Varukorg', style: Theme.of(context).textTheme.titleLarge),
              // Add your cart items here
              SizedBox(height: 20),
              Text('Total: 123,00:-'), // Example value
              ElevatedButton(onPressed: () {}, child: Text('Till kassan')),
            ],
          ),
        ),
      ],
    );
  }
}
