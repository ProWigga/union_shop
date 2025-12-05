import 'package:flutter/material.dart';

class BrowsePage extends StatelessWidget {
  const BrowsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse Products'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'All Products',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Simple example: reuse ProductCard widgets in a grid
              GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: const [
                  // These routeName values should match the slugs used elsewhere
                  // You can add/remove products here as needed
                  
                  // Reuse the ProductCard from main.dart
                  // We reference ProductCard by importing the package in main.dart; consumers
                  // that import BrowsePage will have access as part of the same package.
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Tip: Click any product to open its page or use the browser URL.',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
