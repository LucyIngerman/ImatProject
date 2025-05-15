import 'package:flutter/material.dart';
import 'package:i_mat_project/widgets/log_in_box.dart';




class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
      return const Scaffold(
      body: Column(
        children: [
          LogInBox()
        ],
      ),
    );
  }

}
