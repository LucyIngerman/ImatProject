import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class KontaktInformationForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final VoidCallback onNextPressed;

  const KontaktInformationForm({
    required this.emailController,
    required this.nameController,
    required this.phoneController,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Kontaktinformation',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        CustomTextField(controller: emailController, label: 'Email adress'),
        SizedBox(height: 16),
        CustomTextField(controller: nameController, label: 'Namn'),
        SizedBox(height: 16),
        CustomTextField(controller: phoneController, label: 'Telefonnummer'),
        SizedBox(height: 24),
        ElevatedButton(
          onPressed: onNextPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          ),
          child: Text('Nästa', style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
      ],
    );
  }
}
