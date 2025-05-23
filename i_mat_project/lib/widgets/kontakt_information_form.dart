import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class KontaktInformationForm extends StatefulWidget {
  @override
  _KontaktInformationFormState createState() => _KontaktInformationFormState();
}

class _KontaktInformationFormState extends State<KontaktInformationForm> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(controller: _emailController, label: 'Email adress'),
        SizedBox(height: 16),
        CustomTextField(controller: _nameController, label: 'Namn'),
        SizedBox(height: 16),
        CustomTextField(controller: _phoneController, label: 'Telefonnummer'),
        SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          ),
          child: Text("Nästa", style: TextStyle(fontSize: 16, color: Colors.white)),
        )
      ],
    );
  }
}
