import 'package:flutter/material.dart';
import 'package:i_mat_project/pages/help_page.dart';
import 'package:i_mat_project/pages/main_view.dart';
import 'package:i_mat_project/pages/offers_page.dart';

class ButtonToggleBar extends StatelessWidget {
  final String selectedLabel;
  const ButtonToggleBar({super.key, required this.selectedLabel});

  static const List<String> buttonLabels = ['Kategorier', 'Erbjudanden', 'Hjälp'];

  void _onButtonPressed(BuildContext context, String label) {
    if (label == selectedLabel) return; // No navigation if already selected

    late final Widget page;
    if (label == 'Kategorier') {
      page = MainView();
    } else if (label == 'Erbjudanden') {
      page = OffersPage();
    } else if (label == 'Hjälp') {
      page = HelpPage();
    } else {
      // Fallback to MainView if label is unexpected
      page = MainView();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: buttonLabels.map((label) {
          final bool isSelected = label == selectedLabel;
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: TextButton(
              onPressed: () => _onButtonPressed(context, label),
              style: TextButton.styleFrom(
                backgroundColor: isSelected ? Colors.grey[800] : Colors.grey[300],
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontSize: 16,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
