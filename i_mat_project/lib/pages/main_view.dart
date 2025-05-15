import 'package:flutter/material.dart';
import 'package:i_mat_project/widgets/button_toggle_bar.dart';
import 'package:i_mat_project/widgets/product_grid.dart';
import 'package:i_mat_project/widgets/top_navigation_bar.dart';




class MainView extends StatelessWidget {
  

  const MainView({super.key});

  @override
Widget build(BuildContext context) {

  return Scaffold(
    
    body: Column(
      children: [
        TopNavigationBar(
          logoAssetPath: 'assets/logo.jpg',
          cartTotal: 123.45,
        ),
        ButtonToggleBar(),
        ProductGrid(),
        // The rest of your page
      ],
    ),
  );
}

}
