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
    Key? key,
    required this.logoAssetPath,
    required this.cartTotal,
    this.isLoggedIn = false,
    this.profileImageUrl,
    this.onLogoTap,
    this.onCartTap,
    this.onLoginTap,
  }) : super(key: key);

  static final Color baseColor = Colors.grey[200]!;
  static final Color hoverColor = Colors.grey[350]!;
  static const Color foregroundColor = Colors.black87;

  ButtonStyle _buttonStyle() {
    return ButtonStyle(
      minimumSize: WidgetStateProperty.all(const Size(40, 40)),
      backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.hovered)) return hoverColor;
        return baseColor;
      }),
      foregroundColor: WidgetStateProperty.all(foregroundColor),
      // ignore: deprecated_member_use
      overlayColor: WidgetStateProperty.all(Colors.grey.withOpacity(0.2)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 12)),
      mouseCursor: WidgetStateProperty.resolveWith<MouseCursor>((states) {
        if (states.contains(WidgetState.disabled)) return SystemMouseCursors.basic;
        return SystemMouseCursors.click;
      }),
      elevation: WidgetStateProperty.all(0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            // Logo without ripple or background
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: onLogoTap ?? () {},
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Image.asset(
                    logoAssetPath,
                    height: 40,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),

            // Search Bar fills remaining space
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

            // Cart Button
            TextButton(
              style: _buttonStyle(),
              onPressed: onCartTap ?? () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.shopping_cart),
                  const SizedBox(width: 6),
                  Text('${cartTotal.toStringAsFixed(2).replaceAll('.', ',')}:-'),
                ],
              ),
            ),

            const SizedBox(width: 12),

            // Login/Profile Button
            TextButton(
              style: _buttonStyle(),
              onPressed: onLoginTap ?? () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
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
          ],
        ),
      ),
    );
  }
}
