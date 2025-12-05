import 'package:flutter/material.dart';
import 'package:union_shop/product_card.dart';

class SignatureRangePage extends StatefulWidget {
  const SignatureRangePage({super.key});

  @override
  State<SignatureRangePage> createState() => _SignatureRangePageState();
}

class _SignatureRangePageState extends State<SignatureRangePage> {
  String? _selectedFilter = 'All';
  String? _selectedSort = 'Relevance';
  final List<String> _filterOptions = ['All', 'New', 'Top Seller', 'Limited'];
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
          title: const Text('Signature Range'),
          backgroundColor: const Color(0xFF4d2963)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Non-functional controls: Filter By + Sort By
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
        ]),
      ),
    );
  }
}
