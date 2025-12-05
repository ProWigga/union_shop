import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('About Us',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              Text(
                'Welcome to the Union Shop!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12),
              Text(
                'We’re dedicated to giving you the very best University branded products, with a range of clothing and merchandise available to shop all year round! We even offer an exclusive personalisation service!',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 12),
              Text(
                'All online purchases are available for delivery or instore collection!',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 12),
              Text(
                'We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don’t hesitate to contact us at hello@upsu.net.',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 12),
              Text(
                'Happy shopping!',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 12),
              Text(
                'The Union Shop & Reception Team',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
