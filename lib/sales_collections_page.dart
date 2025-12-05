import 'package:flutter/material.dart';
import 'package:union_shop/product_card.dart';

class SalesCollectionsPage extends StatefulWidget {
  const SalesCollectionsPage({super.key});

  @override
  State<SalesCollectionsPage> createState() => _SalesCollectionsPageState();
}

class _SalesCollectionsPageState extends State<SalesCollectionsPage> {
  String? _selectedFilter = 'All';
  String? _selectedSort = 'Relevance';
  final List<String> _filterOptions = ['All', 'New', 'Limited', 'On Sale'];
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
          title: const Text('Sales Collections'),
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
                children: [
                  ProductCard(
                    title: 'University of Portsmouth HMS Victory Mug',
                    price: '£16.00',
                    originalPrice: '£22.00',
                    imageUrl: 'assets/itemlimited1prgmCW.png',
                    routeName: '/product/hms-victory-mug',
                  ),
                  ProductCard(
                    title: 'Portsmouth City Notebook',
                    price: '£7.00',
                    originalPrice: '£12.00',
                    imageUrl: 'assets/goodie2prgmCW.png',
                    routeName: '/product/notebook',
                  ),
                  ProductCard(
                    title: 'University of Portsmouth HMS Victory Hoodie',
                    price: '£23.00',
                    originalPrice: '£30.00',
                    imageUrl: 'assets/itemlimited2prgmCW.png',
                    routeName: '/product/hms-victory-hoodie',
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
