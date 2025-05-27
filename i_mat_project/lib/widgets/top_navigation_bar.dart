import 'package:flutter/material.dart';
import 'package:i_mat_project/pages/account_page.dart';
import 'package:i_mat_project/pages/category_page.dart';
import 'package:i_mat_project/pages/checkout_page.dart';
import 'package:i_mat_project/pages/login_page.dart';
import 'package:i_mat_project/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class TopNavigationBar extends StatefulWidget {
  final String logoAssetPath;
  final double cartTotal;
  final bool isLoggedIn;
  final String? profileImageUrl;
  final VoidCallback? onLogoTap;
  final VoidCallback? onLoginTap;
  final int itemCount;

  const TopNavigationBar({
    super.key,
    required this.logoAssetPath,
    required this.cartTotal,
    required this.itemCount,
    this.isLoggedIn = false,
    this.profileImageUrl,
    this.onLogoTap,
    this.onLoginTap,
  });

  @override
  State<TopNavigationBar> createState() => _TopNavigationBarState();
}

class _TopNavigationBarState extends State<TopNavigationBar> with SingleTickerProviderStateMixin {
  OverlayEntry? _cartOverlay;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1, 0), // Start offscreen right
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  void _toggleCartOverlay() {
  if (_cartOverlay == null) {
    _cartOverlay = _createOverlayEntry();
    Overlay.of(context).insert(_cartOverlay!);
    _animationController.forward();
  } else {
    _animationController.reverse().then((_) {
      _cartOverlay?.remove();
      _cartOverlay = null;
    });
  }
}

  OverlayEntry _createOverlayEntry() {
  final width = MediaQuery.of(context).size.width * 0.35;

  return OverlayEntry(
    builder: (context) => Stack(
      children: [
        // Fade in background
        FadeTransition(
          opacity: _fadeAnimation,
          child: GestureDetector(
            onTap: _toggleCartOverlay,
            child: Container(color: Colors.black54),
          ),
        ),

        // Slide in sidebar
        Positioned(
          top: 0,
          right: 0,
          bottom: 0,
          width: width,
          child: SlideTransition(
            position: _slideAnimation,
            child: Material(
              elevation: 16,
              color: Colors.white,
              child: Column(
                children: [
                  AppBar(
                  automaticallyImplyLeading: false,
                  title: const Text('Din Kundvagn'),
                  actions: [
                    IconButton(
                    icon: const Icon(Icons.delete_outline),
                    tooltip: 'Ta bort alla artiklar',
                    onPressed: () {
                      final cart = Provider.of<CartProvider>(context, listen: false);
                      cart.clear();
                    },
                    ),
                    IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: _toggleCartOverlay,
                    ),
                  ],
                  ),
                  Expanded(
                  child: Consumer<CartProvider>(
                    builder: (context, cart, _) {
                    if (cart.items.isEmpty) {
                      return const Center(child: Text('Din varukorg är tom.'));
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                      final item = cart.items[index];
                      final prod = item.product;
                      final priceStr = prod['price']
                        .toString()
                        .replaceAll(' kr', '')
                        .replaceAll(',', '.');
                      final price = double.tryParse(priceStr) ?? 0;
                      final total = (price * item.quantity)
                        .toStringAsFixed(2)
                        .replaceAll('.', ',');
                      return ListTile(
                        leading: Image.network(
                        prod['imageUrl'],
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(Icons.image),
                        ),
                        title: Text(prod['name'] ?? ''),
                        subtitle: Text(
                        '${item.quantity} × ${price.toStringAsFixed(2).replaceAll('.', ',')} kr',
                        ),
                        trailing: Text(
                        '$total kr',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      );
                      },
                    );
                    },
                  ),
                  ),

                  // Red button at bottom (only show if cart is not empty)
                  Consumer<CartProvider>(
                  builder: (context, cart, _) {
                    if (cart.items.isEmpty) return const SizedBox.shrink();
                    return Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                      _toggleCartOverlay();
                      // Wait for the overlay animation to complete before navigating
                      Future.delayed(const Duration(milliseconds: 300), () {
                        Navigator.push(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(builder: (context) => CheckoutPage()),
                        );
                      });
                      },
                      style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text(
                      'Fortsätt till varukorgen',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    );
                  },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


  @override
  void dispose() {
    _animationController.dispose();
    _cartOverlay?.remove();
    super.dispose();
  }

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
            // Logo
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CategoryPage()),
                  );
              },
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Image.asset(
                widget.logoAssetPath,
                height: 40,
                ),
              ),
              ),
            ),

            const SizedBox(width: 16),

            // Search Bar
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
              onPressed: _toggleCartOverlay,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(Icons.shopping_cart),
                      if (widget.itemCount > 0)
                        Positioned(
                          left: -22,
                          top: -15,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            constraints: const BoxConstraints(minWidth: 20),
                            child: Text(
                              widget.itemCount > 99 ? '99+' : widget.itemCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 6),
                  Text('${widget.cartTotal.toStringAsFixed(2).replaceAll('.', ',')}:-'),
                ],
              ),
            ),

            const SizedBox(width: 12),

            // Login/Profile Button
            TextButton(
              style: _buttonStyle(),
              onPressed: () {

                if (widget.isLoggedIn) {
                  // If logged in, show account page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountPage()),
                  );
                } else {
                  // If not logged in, show login page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                }
                

              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.isLoggedIn && widget.profileImageUrl != null
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(widget.profileImageUrl!),
                          radius: 12,
                        )
                      : const Icon(Icons.person),
                  const SizedBox(width: 6),
                  Text(widget.isLoggedIn ? 'Profil' : 'Logga in'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
