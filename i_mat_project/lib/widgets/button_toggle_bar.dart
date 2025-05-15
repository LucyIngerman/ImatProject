import 'package:flutter/material.dart';

class ButtonToggleBar extends StatefulWidget {
  const ButtonToggleBar({super.key});

  @override
  _ButtonToggleBarState createState() => _ButtonToggleBarState();
}

class _ButtonToggleBarState extends State<ButtonToggleBar> {
  int selectedIndex = 0;

  final List<String> buttonLabels = ['Kategori', 'Erbjudanden', 'Hjälp?'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200], // Distinct background color for the bar
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(buttonLabels.length, (index) {
          final bool isSelected = index == selectedIndex;
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: isSelected ? Colors.grey[800] : Colors.grey[300],
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                buttonLabels[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontSize: 16,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
