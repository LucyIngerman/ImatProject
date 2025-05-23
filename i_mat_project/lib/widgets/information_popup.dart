import 'package:flutter/material.dart';

class InformationPopup extends StatelessWidget {
  final String title;
  final String description;

  const InformationPopup({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      content: Text(description),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}

// Usage example:
// showDialog(
//   context: context,
//   builder: (context) => InformationPopup(
//     title: 'Product Name',
//     description: 'This is a detailed description of the product.',
//   ),
// );