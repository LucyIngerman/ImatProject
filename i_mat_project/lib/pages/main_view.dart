import 'package:flutter/material.dart';
import 'package:i_mat_project/widgets/top_navigation_bar.dart';




class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
      return const Scaffold(
      body: Column(
        children: [
          TopNavigationBar()
        ],
      ),
    );
  }

}
