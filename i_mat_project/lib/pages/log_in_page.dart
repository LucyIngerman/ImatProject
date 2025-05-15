import 'package:flutter/material.dart';
import 'package:i_mat_project/widgets/log_in_box.dart';
import 'package:i_mat_project/widgets/top_bar.dart';




class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
      return const Scaffold(
      body: Column(
        children: [
          TopBar(),
          LogInBox()
        ],
      ),
    );
  }

}
