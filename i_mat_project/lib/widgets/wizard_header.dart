import 'package:flutter/material.dart';

class WizardHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StepIndicator(label: "1", title: "Kontakt", isActive: true),
        ConnectorLine(),
        StepIndicator(label: "2", title: "Leverans", isActive: false),
        ConnectorLine(),
        StepIndicator(label: "3", title: "Betalning", isActive: false),
      ],
    );
  }
}

class StepIndicator extends StatelessWidget {
  final String label;
  final String title;
  final bool isActive;

  const StepIndicator({
    required this.label,
    required this.title,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: isActive ? Colors.blue : Colors.grey,
          child: Text(label, style: TextStyle(color: Colors.white)),
        ),
        SizedBox(height: 4),
        Text(title, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

class ConnectorLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 2,
        color: Colors.grey[400],
        margin: EdgeInsets.symmetric(horizontal: 4),
      ),
    );
  }
}
