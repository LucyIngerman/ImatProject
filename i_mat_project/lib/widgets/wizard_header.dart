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
          isActive: currentStep == CheckoutStep.kontakt,
        ),
        ConnectorLine(isActive: currentStep.index > 0),
        StepIndicator(
          label: "2",
          title: "Leverans",
          isActive: currentStep == CheckoutStep.leverans,
        ),
        ConnectorLine(isActive: currentStep.index > 1),
        StepIndicator(
          label: "3",
          title: "Betalning",
          isActive: currentStep == CheckoutStep.betalning,
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: isActive ? Colors.blue : Colors.grey,
          child: Text(label, style: const TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class ConnectorLine extends StatelessWidget {
  final bool isActive;

  const ConnectorLine({this.isActive = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 2,
        color: isActive ? Colors.blue : Colors.grey[400],
        margin: const EdgeInsets.symmetric(horizontal: 4),
      ),
    );
  }
}
