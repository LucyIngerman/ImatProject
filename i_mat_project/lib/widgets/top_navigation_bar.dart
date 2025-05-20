import 'package:flutter/material.dart';

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
  // ignore: library_private_types_in_public_api
  _TopNavigationBarState createState() => _TopNavigationBarState();
}

class _TopNavigationBarState extends State<TopNavigationBar>
    with SingleTickerProviderStateMixin {
  bool _isCartOpen = false;

  late final AnimationController _animationController;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1, 0), // Offscreen right
      end: Offset.zero, // Onscreen
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  void _toggleCart() {
    setState(() {
      _isCartOpen = !_isCartOpen;
      if (_isCartOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
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
    final cartWidth = MediaQuery.of(context).size.width * 0.35;

    return Stack(
      children: [
        Material(
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                // Logo
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: widget.onLogoTap ?? () {},
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
                  onPressed: _toggleCart,
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
                  onPressed: widget.onLoginTap ?? () {},
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
        ),

        // Dark overlay behind sidebar
        if (_isCartOpen)
          Positioned.fill(
            child: GestureDetector(
              onTap: _toggleCart,
              child: Container(
                color: Colors.black54,
              ),
            ),
          ),

        // Sliding cart sidebar
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          width: cartWidth,
          child: SlideTransition(
            position: _slideAnimation,
            child: Material(
              elevation: 20000,
              color: Colors.white,
              child: Column(
                children: [
                  AppBar(
                    automaticallyImplyLeading: false,
                    title: const Text('Your Cart'),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: _toggleCart,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Center(
                      child: Text('Cart content here'), // Replace with your cart content
                    ),
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
