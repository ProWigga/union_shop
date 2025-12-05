import 'package:flutter/material.dart';
import 'package:union_shop/product_card.dart';

class PortsmouthItemsPage extends StatefulWidget {
  const PortsmouthItemsPage({super.key});

  @override
  State<PortsmouthItemsPage> createState() => _PortsmouthItemsPageState();
}

class _PortsmouthItemsPageState extends State<PortsmouthItemsPage> {
  String? _selectedFilter = 'All';
  String? _selectedSort = 'Relevance';
  final List<String> _filterOptions = ['All', 'Souvenir', 'Small', 'Large'];
  final List<String> _sortOptions = [
    'Relevance',
    'Price: Low to High',
    'Price: High to Low',
    'Newest'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Portsmouth City Items'),
          backgroundColor: const Color(0xFF4d2963)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedFilter,
                    decoration: const InputDecoration(labelText: 'Filter By'),
                    items: _filterOptions
                        .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                        .toList(),
                    onChanged: (v) => setState(() => _selectedFilter = v),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedSort,
                    decoration: const InputDecoration(labelText: 'Sort By'),
                    items: _sortOptions
                        .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                        .toList(),
                    onChanged: (v) => setState(() => _selectedSort = v),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.8,
                children: const [
                  ProductCard(
                    title: 'Portsmouth City Notebook',
                    price: '£7.00',
                    originalPrice: '£12.00',
                    imageUrl: 'assets/goodie2prgmCW.png',
                    routeName: '/product/notebook',
                  ),
                  ProductCard(
                    title: 'Portsmouth City Magnet',
                    price: '£3.50',
                    imageUrl: 'assets/goodie1prgmCW.png',
                    routeName: '/product/magnet_1',
                  ),
                  ProductCard(
                    title: 'Portsmouth City Magnet (Large)',
                    price: '£5.00',
                    imageUrl:
                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                    routeName: '/product/magnet_2',
                  ),
                  ProductCard(
                    title: 'Portsmouth City Bookmark',
                    price: '£2.50',
                    imageUrl: 'assets/goodie3prgmCW.png',
                    routeName: '/product/bookmark',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
