import 'package:flutter/material.dart';

class LogInBox extends StatefulWidget {
  const LogInBox({super.key});

  @override
  State<LogInBox> createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LogInBox> {
  bool keepLoggedIn = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300, // square box
        height: 300,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Logga in',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Bank - id'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Mail'),
            ),
            const SizedBox(height: 20),
            Text(
              'Avbryt',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: keepLoggedIn,
                  onChanged: (value) {
                    setState(() {
                      keepLoggedIn = value ?? true;
                    });
                  },
                ),
                const Text('Håll mig inloggad'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
