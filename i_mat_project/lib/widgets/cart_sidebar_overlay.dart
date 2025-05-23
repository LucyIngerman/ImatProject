// lib/widgets/cart_sidebar_overlay.dart
import 'package:flutter/material.dart';

class CartSidebarOverlay {
  static OverlayEntry? _overlayEntry;

  static void show(BuildContext context, Widget sidebarContent) {
    if (_overlayEntry != null) return; // prevent duplicates

    _overlayEntry = OverlayEntry(
      builder: (_) => Positioned(
        top: 0,
        bottom: 0,
        right: 0,
        width: 300,
        child: Material(
          elevation: 1000,
          color: Colors.white,
          child: sidebarContent,
        ),
      ),
    );

    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
  }

  static void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  static bool get isShowing => _overlayEntry != null;
}
