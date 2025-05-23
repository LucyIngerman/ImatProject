import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    // For responsive layout
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Container(
      color: Colors.grey[900],
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      child: isSmallScreen
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildLinks(),
                const SizedBox(height: 20),
                _buildSocialIcons(),
                const SizedBox(height: 20),
                _buildCopyright(),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCopyright(),
                _buildLinks(),
                _buildSocialIcons(),
              ],
            ),
    );
  }

  Widget _buildCopyright() {
    return const Text(
      '© 2025 IMAT. All rights reserved.',
      style: TextStyle(color: Colors.white70),
    );
  }

  Widget _buildLinks() {
    return Wrap(
      spacing: 20,
      children: [
        _footerLink('Home', () {/* navigate to home */}),
        _footerLink('About', () {/* navigate to about */}),
        _footerLink('Services', () {/* navigate to services */}),
        _footerLink('Contact', () {/* navigate to contact */}),
      ],
    );
  }

  Widget _footerLink(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white70,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _socialIcon(Icons.facebook, 'https://www.facebook.com/imat.online'),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _socialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () {
        // You can use url_launcher package to open the link
        // launch(url);
      },
      child: Icon(
        icon,
        color: Colors.white70,
        size: 24,
      ),
    );
  }
}
