import 'package:flutter/material.dart';

class SalesCollectionsPage extends StatelessWidget {
  const SalesCollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Sales Collections'),
          backgroundColor: const Color(0xFF4d2963)),
      body: const Center(
          child:
              Text('Welcome to Sales Collections — replace with real items')),
    );
  }
}
