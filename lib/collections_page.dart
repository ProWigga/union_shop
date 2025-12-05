import 'package:flutter/material.dart';
import 'package:union_shop/product_card.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 1,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.8,
          children: const [
            ProductCard(
              title: 'Sales Collections',
              price: 'From £16.00',
              imageUrl: 'assets/itemlimited1prgmCW.png',
              routeName: '/collection/sales-collections',
            ),
            ProductCard(
              title: 'Signature Range',
              price: 'From £15.00',
              imageUrl: 'assets/item1prgmCW.png',
              routeName: '/collection/signature-range',
            ),
            ProductCard(
              title: 'Portsmouth City Items',
              price: 'From £2.50',
              imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
              routeName: '/collection/portsmouth-city-items',
            ),
          ],
        ),
      ),
    );
  }
}
