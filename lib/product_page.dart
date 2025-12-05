import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

// Simple in-memory product catalog for demo purposes.
// Keys are slugs used in the route, e.g. '/product/hoodie' -> slug 'hoodie'.
const Map<String, Map<String, String>> productCatalog = {
  'hoodie': {
    'title': 'University of Portsmouth Hoodie',
    'price': '£30.00',
    'originalPrice': '£30.00',
    'imageUrl': 'assets/item3prgmCW.png',
    'description':
        'A comfortable cotton hoodie with the University of Portsmouth logo. Machine washable and available in multiple sizes.',
  },
  'cap': {
    'title': 'University of Portsmouth Cap',
    'price': '£15.00',
    'originalPrice': '£15.00',
    'imageUrl': 'assets/item4prgmCW.png',
    'description':
        'Cool Cap, comes in multiple colours and sizes.',
  },
    'sweatshirt': {
    'title': 'University of Portsmouth Sweatshirt',
    'price': '£25.00',
    'originalPrice': '£25.00',
    'imageUrl': 'assets/item1prgmCW.png',
    'description':
        'Warm Sweatshirt, comes in multiple colours and sizes. Washing machine safe.',
  },
  't-shirt': {
    'title': 'University of Portsmouth T-Shirt',
    'price': '£20.00',
    'originalPrice': '£20.00',
    'imageUrl': 'assets/item2prgmCW.png',
    'description':
        'Slick T-Shirt, comes in multiple colours and sizes. Washing machine safe.',
  },

};

class ProductPage extends StatefulWidget {
  final String? productId;

  const ProductPage({super.key, this.productId});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // hoodie options
  final List<String> _availableSizes = ['XS', 'S', 'M', 'L', 'XL'];
  final List<String> _availableColours = ['Black', 'Navy', 'Grey', 'White'];

  final List<String> _signatureRangeIds = [
    'sweatshirt',
    't-shirt',
    'hoodie',
    'cap'
  ];

  String? _selectedSize;
  String? _selectedColour;

  @override
  void initState() {
    super.initState();
    _selectedSize = _availableSizes[2];
    _selectedColour = _availableColours[0];
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String>? product = (widget.productId != null &&
            productCatalog.containsKey(widget.productId))
        ? productCatalog[widget.productId]
        : null;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              height: 100,
              color: Colors.white,
              child: Column(
                children: [
                  // Top banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    color: const Color(0xFF4d2963),
                    child: const Text(
                      'PLACEHOLDER HEADER TEXT',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  // Main header
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              navigateToHome(context);
                            },
                            child: Image.network(
                              'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                              height: 18,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  width: 18,
                                  height: 18,
                                  child: const Center(
                                    child: Icon(Icons.image_not_supported,
                                        color: Colors.grey),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Spacer(),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 600),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.search,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.person_outline,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.shopping_bag_outlined,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.menu,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: placeholderCallbackForButtons,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Product details
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product image (use local asset if available in catalog, otherwise fallback)
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: product != null
                          ? (product['imageUrl']!.startsWith('http')
                              ? Image.network(
                                  product['imageUrl']!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey[300],
                                      child: const Center(
                                        child: Icon(Icons.image_not_supported,
                                            size: 64, color: Colors.grey),
                                      ),
                                    );
                                  },
                                )
                              : Image.asset(
                                  product['imageUrl']!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey[300],
                                      child: const Center(
                                        child: Icon(Icons.image_not_supported,
                                            size: 64, color: Colors.grey),
                                      ),
                                    );
                                  },
                                ))
                          : Image.network(
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  child: const Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.image_not_supported,
                                          size: 64,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Image unavailable',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Product name (show id/slug if provided)
                  // Product name
                  Text(
                    product != null
                        ? product['title']!
                        : 'Placeholder Product Name',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Product price
                  Text(
                    product != null ? product['price']! : '£15.00',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4d2963),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Product description
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product != null
                        ? product['description']!
                        : 'This is a placeholder description for the product. Students should replace this with real product information and implement proper data management.',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Options (size + colour) — shown for all signature range product pages
                  if (widget.productId != null &&
                      _signatureRangeIds.contains(widget.productId))
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Options',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: InputDecorator(
                                decoration: const InputDecoration(
                                  labelText: 'Size',
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  border: OutlineInputBorder(),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _selectedSize,
                                    isExpanded: true,
                                    items: _availableSizes
                                        .map((s) => DropdownMenuItem(
                                            value: s, child: Text(s)))
                                        .toList(),
                                    onChanged: (v) =>
                                        setState(() => _selectedSize = v),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: InputDecorator(
                                decoration: const InputDecoration(
                                  labelText: 'Colour',
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  border: OutlineInputBorder(),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _selectedColour,
                                    isExpanded: true,
                                    items: _availableColours
                                        .map((s) => DropdownMenuItem(
                                            value: s, child: Text(s)))
                                        .toList(),
                                    onChanged: (v) =>
                                        setState(() => _selectedColour = v),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),

                  if (product != null)
                    ElevatedButton(
                      onPressed: () {
                        // TODO: implement add-to-cart
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to cart')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4d2963),
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Text('Add to cart'),
                      ),
                    ),
                ],
              ),
            ),

            // Footer
            Container(
              width: double.infinity,
              color: Colors.grey[50],
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Opening Hours',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  const Text('❄️ Winter Break Closure Dates ❄️',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 6),
                  const Text('Closing 4pm 19/12/2025'),
                  const Text('Reopening 10am 05/01/2026'),
                  const Text('Last post date: 12pm on 18/12/2025'),
                  const SizedBox(height: 8),
                  const Divider(),
                  const SizedBox(height: 8),
                  const Text('(Term Time)',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  const Text('Monday - Friday 10am - 4pm'),
                  const SizedBox(height: 6),
                  const Text('(Outside of Term Time / Consolidation Weeks)',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  const Text('Monday - Friday 10am - 3pm'),
                  const SizedBox(height: 8),
                  const Text('Purchase online 24/7',
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 12),
                  const Text('Help and Information',
                      style: TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () async {
                          await launchUrlString('https://dummylink.co.uk');
                        },
                        child: const Text('Search'),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () async {
                          await launchUrlString('https://dummylink.co.uk');
                        },
                        child: const Text('Terms & Conditions'),
                      ),
                    ],
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
