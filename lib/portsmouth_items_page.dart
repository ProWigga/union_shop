import 'package:flutter/material.dart';

class PortsmouthItemsPage extends StatelessWidget {
  const PortsmouthItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Portsmouth City Items'),
          backgroundColor: const Color(0xFF4d2963)),
      body: const Center(
          child: Text(
              'Welcome to Portsmouth City Items — replace with real items')),
    );
  }
}
