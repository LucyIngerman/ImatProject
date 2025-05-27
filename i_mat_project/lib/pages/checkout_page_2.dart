import 'package:flutter/material.dart';
import 'package:i_mat_project/providers/cart_provider.dart';
import 'package:i_mat_project/widgets/betalning_form.dart';
import 'package:i_mat_project/widgets/button_toggle_bar.dart';
import 'package:i_mat_project/widgets/kontakt_information_form.dart';
import 'package:i_mat_project/widgets/leverans_information_form.dart';
import 'package:i_mat_project/widgets/top_navigation_bar.dart';
import 'package:i_mat_project/widgets/wizard_header.dart';
import 'package:i_mat_project/model/checkout_step.dart';
import 'package:provider/provider.dart';



class CheckoutPage2 extends StatefulWidget {
  const CheckoutPage2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CheckoutPage2State createState() => _CheckoutPage2State();
}

class _CheckoutPage2State extends State<CheckoutPage2> {
  CheckoutStep currentStep = CheckoutStep.kontakt;

  // Step 1 controllers
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  // Step 2 controllers
  final _postnummerController = TextEditingController();
  final _adressController = TextEditingController();
  final _lagenhetsnummerController = TextEditingController();

  // Step 3 controller
  final _messageController = TextEditingController();
  bool _wantsToSendMessage = false;

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _postnummerController.dispose();
    _adressController.dispose();
    _lagenhetsnummerController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _goToNextStep() {
    setState(() {
      if (currentStep == CheckoutStep.kontakt) {
        currentStep = CheckoutStep.leverans;
      } else if (currentStep == CheckoutStep.leverans) {
        currentStep = CheckoutStep.meddelande;
      } else if (currentStep == CheckoutStep.meddelande) {
        currentStep = CheckoutStep.betalning;
      }
    });
  }

  void _goToPreviousStep() {
    setState(() {
      if (currentStep == CheckoutStep.meddelande) {
        currentStep = CheckoutStep.leverans;
        _wantsToSendMessage = false;
        _messageController.clear();
      }
    });
  }

  Widget _buildMessageStep() {
    if (!_wantsToSendMessage) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Vill du skicka ett meddelande till leverantören?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _wantsToSendMessage = true;
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text("Ja", style: TextStyle(color: Colors.white)),
              ),
              SizedBox(width: 12),
              ElevatedButton(
                onPressed: _goToNextStep,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: Text("Nej", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Vad vill du meddela?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          TextField(
            controller: _messageController,
            maxLines: 4,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Skriv ditt meddelande här...",
            ),
          ),
          SizedBox(height: 24),
          Row(
            children: [
              ElevatedButton(
                onPressed: _goToPreviousStep,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                child: Text("Gå tillbaka", style: TextStyle(color: Colors.white)),
              ),
              SizedBox(width: 12),
              ElevatedButton(
                onPressed: _goToNextStep,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text("Skicka", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey topNavKey = GlobalKey();

    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TopNavigationBar
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TopNavigationBar(
                key: topNavKey,
                logoAssetPath: 'assets/logo_2.png',
                cartTotal: cart.totalPrice,
                itemCount: cart.itemCount,
              ),
            ),
            // ButtonToggleBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ButtonToggleBar(selectedLabel: '',),
            ),
            // Logo
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
                      BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 2),
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
                          onNextPressed: _goToNextStep,
                        ),
                      if (currentStep == CheckoutStep.meddelande)
                        _buildMessageStep(),
                      if (currentStep == CheckoutStep.betalning)
                      BetalningForm(
                        onNextPressed: () {
                          // Go to summary or submit order
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
