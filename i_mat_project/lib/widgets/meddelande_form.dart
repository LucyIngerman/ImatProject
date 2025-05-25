import 'package:flutter/material.dart';

class MeddelandeForm extends StatefulWidget {
  final VoidCallback onSkip;
  final ValueChanged<String> onSubmit;
  final VoidCallback onBack;

  const MeddelandeForm({
    required this.onSkip,
    required this.onSubmit,
    required this.onBack,
  });

  @override
  _MeddelandeFormState createState() => _MeddelandeFormState();
}

class _MeddelandeFormState extends State<MeddelandeForm> {
  bool wantsToSendMessage = false;
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Vill du skicka ett meddelande till leverantören?",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        if (!wantsToSendMessage)
          Row(
            children: [
              ElevatedButton(
                onPressed: () => setState(() => wantsToSendMessage = true),
                child: Text("Ja"),
              ),
              SizedBox(width: 12),
              ElevatedButton(
                onPressed: widget.onSkip,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: Text("Nej"),
              ),
            ],
          ),
        if (wantsToSendMessage) ...[
          SizedBox(height: 24),
          Text("Vad vill du meddela?"),
          SizedBox(height: 8),
          TextField(
            controller: _messageController,
            maxLines: 3,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Skriv ditt meddelande här...",
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              TextButton(
                onPressed: widget.onBack,
                child: Text("Gå tillbaka"),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () => widget.onSubmit(_messageController.text),
                child: Text("Skicka"),
              ),
            ],
          ),
        ]
      ],
    );
  }
}
