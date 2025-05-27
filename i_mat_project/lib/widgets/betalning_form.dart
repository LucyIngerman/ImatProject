import 'package:flutter/material.dart';

class BetalningForm extends StatefulWidget {
  final VoidCallback onNextPressed;

  const BetalningForm({required this.onNextPressed, super.key});

  @override
  State<BetalningForm> createState() => _BetalningFormState();
}

class _BetalningFormState extends State<BetalningForm> {
  String? _selected;

  void _select(String method) {
    setState(() {
      _selected = method;
    });
  }

  Widget _buildPaymentButton({
    required String method,
    required String label,
    Color? color,
    Widget? icon,
  }) {
    final isSelected = _selected == method;

    return SizedBox(
      width: 220,
      height: 60,
      child: ElevatedButton(
        onPressed: () => _select(method),
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.white,
          foregroundColor: Colors.black,
          elevation: isSelected ? 3 : 1,
          side: BorderSide(
            color: isSelected ? Colors.black : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon, 
              SizedBox(width: 10),
            ],
            Text(label, style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Hur vill du betala?",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 24),

        _buildPaymentButton(
          method: "klarna",
          label: "Klarna",
          color: Colors.pink[100],
        ),
        SizedBox(height: 16),

        _buildPaymentButton(
          method: "swish",
          label: "Swish",
          icon: Image.asset(
            'assets/swish.png',
            width: 24,
            height: 24,
          ),
        ),
        SizedBox(height: 16),

        _buildPaymentButton(
          method: "card",
          label: "Bankkort",
          icon: Image.asset(
            'assets/card.png',
            width: 24,
            height: 24,
          ),
        ),
        SizedBox(height: 32),

        SizedBox(
          width: 160,
          height: 50,
          child: ElevatedButton(
            onPressed: _selected == null ? null : widget.onNextPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              "Nästa",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
