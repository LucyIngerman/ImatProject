import 'package:flutter/material.dart';
import 'package:i_mat_project/providers/cart_provider.dart';
import 'package:i_mat_project/widgets/button_toggle_bar.dart';
import 'package:i_mat_project/widgets/footer.dart';
import 'package:i_mat_project/widgets/kontakt_information_form.dart';
import 'package:i_mat_project/widgets/top_navigation_bar.dart';
import 'package:i_mat_project/widgets/wizard_header.dart';
import 'package:provider/provider.dart';


class CheckoutPage2 extends StatelessWidget {
  const CheckoutPage2({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey topNavKey = GlobalKey();

    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TopNavigationBar at the top
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TopNavigationBar(
                key: topNavKey,
                logoAssetPath: 'assets/logo_2.png',
                cartTotal: cart.totalPrice,
                itemCount: cart.itemCount,
              ),
            ),
            // ButtonToggleBar below TopNavigationBar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ButtonToggleBar(selectedLabel: '',),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
              child: SizedBox(
                width: 120,
                height: 70,
                child: Placeholder(),
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 800),
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 2),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      WizardHeader(),
                      SizedBox(height: 24),
                      KontaktInformationForm(),
                    ],
                  ),
                ),
              ),
            ),
            // Footer widget at the bottom
            Footer(),
          ],
        ),
      ),
    );
  }
}
