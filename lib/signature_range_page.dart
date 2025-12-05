import 'package:flutter/material.dart';
import 'package:union_shop/product_card.dart';

class SignatureRangePage extends StatelessWidget {
  const SignatureRangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Signature Range'),
          backgroundColor: const Color(0xFF4d2963)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.8,
          children: [
            ProductCard(
              title: 'University of Portsmouth Sweatshirt',
              price: '£25.00',
              imageUrl: 'assets/item1prgmCW.png',
              routeName: '/product/sweatshirt',
            ),
            ProductCard(
              title: 'University of Portsmouth T-Shirt',
              price: '£20.00',
              imageUrl: 'assets/item2prgmCW.png',
              routeName: '/product/t-shirt',
            ),
            ProductCard(
              title: 'University of Portsmouth Hoodie',
              price: '£30.00',
              imageUrl: 'assets/item3prgmCW.png',
              routeName: '/product/hoodie',
            ),
            ProductCard(
              title: 'University of Portsmouth Cap',
              price: '£15.00',
              imageUrl: 'assets/item4prgmCW.png',
              routeName: '/product/cap',
            ),
          ],
        ),
      ),
    );
  }
}
