import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How can we help you?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'If you have any questions or need assistance, please refer to the following options:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Contact Support'),
              subtitle: Text('Email us at support@example.com'),
              onTap: () {
                // Add email functionality here
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('User Guide'),
              subtitle: Text('Read the user guide for detailed instructions'),
              onTap: () {
                // Navigate to user guide page
              },
            ),
            ListTile(
              leading: Icon(Icons.forum),
              title: Text('Community Forum'),
              subtitle: Text('Join the discussion with other users'),
              onTap: () {
                // Navigate to community forum
              },
            ),
          ],
        ),
      ),
    );
  }
}