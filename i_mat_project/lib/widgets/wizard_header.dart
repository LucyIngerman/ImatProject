import 'package:flutter/material.dart';
import 'package:i_mat_project/model/checkout_step.dart';

class WizardHeaderActiveStep extends StatelessWidget {
  final CheckoutStep currentStep;

  const WizardHeaderActiveStep({required this.currentStep, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StepIndicator(
          label: "1",
          title: "Kontakt",
          isActive: currentStep.index >= CheckoutStep.kontakt.index,
        ),
        ConnectorLine(isActive: currentStep.index > CheckoutStep.kontakt.index),
        StepIndicator(
          label: "2",
          title: "Leverans",
          isActive: currentStep.index >= CheckoutStep.leverans.index,
        ),
        ConnectorLine(isActive: currentStep.index > CheckoutStep.leverans.index),
        StepIndicator(
          label: "3",
          title: "Betalning",
          isActive: currentStep.index >= CheckoutStep.betalning.index,
        ),
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
  final bool isActive;

  const ConnectorLine({this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 2,
        color: isActive ? Colors.blue : Colors.grey[400],
        margin: EdgeInsets.symmetric(horizontal: 4),
      ),
    );
  }
}
