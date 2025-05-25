import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class KontaktInformationForm extends StatefulWidget {
  const KontaktInformationForm({super.key});

  @override
  _KontaktInformationFormState createState() => _KontaktInformationFormState();
}

class _KontaktInformationFormState extends State<KontaktInformationForm> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    // Handle next step, e.g. validation or navigation
    // For example:
    // if (_emailController.text.isNotEmpty && ... ) { ... }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align to left
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            "Kontaktinformation",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        CustomTextField(controller: _emailController, label: 'Email adress'),
        SizedBox(height: 16),
        CustomTextField(controller: _nameController, label: 'Namn'),
        SizedBox(height: 16),
        CustomTextField(controller: _phoneController, label: 'Telefonnummer'),
        SizedBox(height: 24),
        ElevatedButton(
          onPressed: _onNextPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          ),
          child: Text(
            "Nästa",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
