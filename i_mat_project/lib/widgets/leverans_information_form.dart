import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class LeveransInformationForm extends StatelessWidget {
  final TextEditingController postnummerController;
  final TextEditingController adressController;
  final TextEditingController lagenhetsnummerController;
  final VoidCallback onNextPressed;

  const LeveransInformationForm({
    required this.postnummerController,
    required this.adressController,
    required this.lagenhetsnummerController,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Leveransinformation',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        CustomTextField(controller: postnummerController, label: 'Postnummer'),
        SizedBox(height: 16),
        CustomTextField(controller: adressController, label: 'Adress'),
        SizedBox(height: 16),
        CustomTextField(
          controller: lagenhetsnummerController,
          label: 'Lägenhetsnummer (valfritt)',
        ),
        SizedBox(height: 24),
        ElevatedButton(
          onPressed: onNextPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          ),
          child: Text(
            'Nästa',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
