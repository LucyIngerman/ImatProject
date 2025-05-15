import 'package:flutter/material.dart';

class TopNavigationBar extends StatelessWidget {
  final String logoAssetPath;
  final double cartTotal;
  final bool isLoggedIn;
  final String? profileImageUrl;

  final VoidCallback? onLogoTap;
  final VoidCallback? onCartTap;
  final VoidCallback? onLoginTap;

  const TopNavigationBar({
    super.key,
    required this.logoAssetPath,
    required this.cartTotal,
    this.isLoggedIn = false,
    this.profileImageUrl,
    this.onLogoTap,
    this.onCartTap,
    this.onLoginTap,
  });

  @override
  Widget build(BuildContext context) {
    final baseColor = Colors.grey[200];
    final hoverColor = Colors.grey[350];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      child: Row(
        children: [
          // Logo button
          Container(
            decoration: BoxDecoration(
              color: baseColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: onLogoTap,
                mouseCursor: SystemMouseCursors.click,
                hoverColor: hoverColor,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Image.asset(
                    logoAssetPath,
                    height: 40,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Search bar
          Expanded(
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Sök...',
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                    isCollapsed: true,
                  ),
                  style: TextStyle(height: 1.0),
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Cart button
          Container(
            decoration: BoxDecoration(
              color: baseColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: onCartTap,
                mouseCursor: SystemMouseCursors.click,
                hoverColor: hoverColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: [
                      const Icon(Icons.shopping_cart),
                      const SizedBox(width: 6),
                      Text('${cartTotal.toStringAsFixed(2).replaceAll('.', ',')}:-'),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Login/Profile button
          Container(
            decoration: BoxDecoration(
              color: baseColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: onLoginTap,
                mouseCursor: SystemMouseCursors.click,
                hoverColor: hoverColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    children: [
                      isLoggedIn && profileImageUrl != null
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(profileImageUrl!),
                              radius: 12,
                            )
                          : const Icon(Icons.person),
                      const SizedBox(width: 6),
                      Text(isLoggedIn ? 'Profil' : 'Logga in'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
