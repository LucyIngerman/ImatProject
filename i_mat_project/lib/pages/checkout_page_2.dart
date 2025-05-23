import 'package:flutter/material.dart';
import 'package:i_mat_project/widgets/kontakt_information_form.dart';
import 'package:i_mat_project/widgets/wizard_header.dart';


class CheckoutPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start, // ← Align children left
    children: [
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
    ],
  ),
),
    );
  }
}
