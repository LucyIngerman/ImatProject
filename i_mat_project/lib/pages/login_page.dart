import 'package:flutter/material.dart';
import 'package:i_mat_project/pages/account_page.dart';
import 'package:i_mat_project/providers/cart_provider.dart';
import 'package:i_mat_project/widgets/button_toggle_bar.dart';
import 'package:i_mat_project/widgets/footer.dart';
import 'package:i_mat_project/widgets/log_in_box.dart';
import 'package:i_mat_project/widgets/top_navigation_bar.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });
      // Simulate a login delay
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        _isLoading = false;
      });
      // Navigate to the account page after successful login
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const AccountPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey topNavKey = GlobalKey();

    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          TopNavigationBar(
            key: topNavKey,
            logoAssetPath: 'assets/logo_2.png',
            cartTotal: cart.totalPrice,
            itemCount: cart.itemCount,
          ),
          ButtonToggleBar(selectedLabel:""),
          Expanded(
            child: Center(
              child: LogInBox(),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}
