import 'package:flutter/material.dart';
import 'package:i_mat_project/model/checkout_step.dart'; 
import 'package:i_mat_project/widgets/kontakt_information_form.dart';
import 'package:i_mat_project/widgets/leverans_information_form.dart';
import 'package:i_mat_project/widgets/wizard_header.dart';

class CheckoutPage2 extends StatefulWidget {
  @override
  _CheckoutPage2State createState() => _CheckoutPage2State();
}

class _CheckoutPage2State extends State<CheckoutPage2> {
  CheckoutStep currentStep = CheckoutStep.kontakt;

  // Controllers as before
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  final _postnummerController = TextEditingController();
  final _adressController = TextEditingController();
  final _lagenhetsnummerController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _postnummerController.dispose();
    _adressController.dispose();
    _lagenhetsnummerController.dispose();
    super.dispose();
  }

  void _goToNextStep() {
    setState(() {
      if (currentStep == CheckoutStep.kontakt) {
        currentStep = CheckoutStep.leverans;
      } else {
        // Add next steps or finish logic here
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
              child: SizedBox(
                width: 120,
                height: 70,
                child: Placeholder(),
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 800),
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12, blurRadius: 8, spreadRadius: 2),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      WizardHeaderActiveStep(currentStep: currentStep),
                      SizedBox(height: 24),
                      if (currentStep == CheckoutStep.kontakt)
                        KontaktInformationForm(
                          emailController: _emailController,
                          nameController: _nameController,
                          phoneController: _phoneController,
                          onNextPressed: _goToNextStep,
                        ),
                      if (currentStep == CheckoutStep.leverans)
                        LeveransInformationForm(
                          postnummerController: _postnummerController,
                          adressController: _adressController,
                          lagenhetsnummerController: _lagenhetsnummerController,
                          onNextPressed: () {
                            // Next step or finish logic here
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
