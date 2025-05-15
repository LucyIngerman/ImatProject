import 'package:flutter/material.dart';

class TopNavigationBar extends StatelessWidget {
  final String logoAssetPath;
  final double cartTotal;
  final bool isLoggedIn;
  final String? profileImageUrl;

  const TopNavigationBar({
    super.key,
    required this.logoAssetPath,
    required this.cartTotal,
    this.isLoggedIn = false,
    this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      child: Row(
        children: [
          // Logo
          Image.asset(
            logoAssetPath,
            height: 40,
          ),

          const SizedBox(width: 16),

          // Expanded Search Bar
          Expanded(
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Cart Icon + Price
          Row(
            children: [
              const Icon(Icons.shopping_cart),
              const SizedBox(width: 4),
              Text('\$${(cartTotal).toStringAsFixed(2)}'),
            ],
          ),

          const SizedBox(width: 16),

          // Profile Icon + Log In
          TextButton.icon(
            onPressed: () {
              // Handle login or profile navigation
            },
            icon: isLoggedIn && profileImageUrl != null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(profileImageUrl!),
                    radius: 12,
                  )
                : const Icon(Icons.person),
            label: Text(isLoggedIn ? 'Profile' : 'Log In'),
          ),
        ],
      ),
    );
  }
}
