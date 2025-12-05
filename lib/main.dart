import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/product_card.dart';
import 'package:union_shop/collections_page.dart';
import 'package:union_shop/about_page.dart';
import 'package:union_shop/browse_page.dart';
import 'package:union_shop/sales_collections_page.dart';
import 'package:union_shop/signature_range_page.dart';
import 'package:union_shop/portsmouth_items_page.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomeScreen(),
      // By default, the app starts at the '/' route, which is the HomeScreen
      initialRoute: '/',
      // Use onGenerateRoute so we can map dynamic product routes like
      // '/product/hms-victory-mug' to the ProductPage and pass the id/slug.
      onGenerateRoute: (settings) {
        final name = settings.name ?? '';
        // Handle '/product' and '/product/' routes (generic product page)
        if (name == '/product' || name == '/product/') {
          return MaterialPageRoute(
            builder: (context) => const ProductPage(),
            settings: settings,
          );
        }

        // Browse page route
        if (name == '/browse') {
          return MaterialPageRoute(
            builder: (context) => const BrowsePage(),
            settings: settings,
          );
        }

        // Handle '/product/:id' style routes
        if (name.startsWith('/product/')) {
          final id = name.replaceFirst('/product/', '');
          return MaterialPageRoute(
            builder: (context) => ProductPage(productId: id),
            settings: settings,
          );
        }

        // Collections page route
        if (name == '/collections') {
          return MaterialPageRoute(
            builder: (context) => const CollectionsPage(),
            settings: settings,
          );
        }

        // Collection detail routes
        if (name == '/collection/sales-collections') {
          return MaterialPageRoute(
            builder: (context) => const SalesCollectionsPage(),
            settings: settings,
          );
        }

        if (name == '/collection/signature-range') {
          return MaterialPageRoute(
            builder: (context) => const SignatureRangePage(),
            settings: settings,
          );
        }

        if (name == '/collection/portsmouth-city-items') {
          return MaterialPageRoute(
            builder: (context) => const PortsmouthItemsPage(),
            settings: settings,
          );
        }

        // About page route
        if (name == '/about') {
          return MaterialPageRoute(
            builder: (context) => const AboutPage(),
            settings: settings,
          );
        }

        // Fallback to home
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: settings,
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
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
                      'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
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
                                // About Us text button at top-right
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pushNamed(context, '/about'),
                                  style: TextButton.styleFrom(
                                    foregroundColor:
                                        const Color.fromARGB(255, 0, 0, 0),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    textStyle: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  child: const Text('About Us'),
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

            // Hero Section
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  ),
                  // Content overlay
                  Positioned(
                    left: 24,
                    right: 24,
                    top: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'PORTSMOUTH CITY COLLECTION',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "City of Portsmouth themed goodies.",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/browse');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text(
                            'BROWSE PRODUCTS',
                            style: TextStyle(fontSize: 14, letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'ESSENTIAL RANGE - OVER 20% OFF!',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: const [
                        ProductCard(
                          title: 'University of Portsmouth HMS Victory Mug',
                          price: '£16.00',
                          originalPrice: "£22.00",
                          imageUrl: 'assets/itemlimited1prgmCW.png',
                          routeName: '/product/hms-victory-mug',
                        ),
                        ProductCard(
                          title: 'University of Portsmouth HMS Victory Hoodie',
                          price: '£23.00',
                          originalPrice: "£30.00",
                          imageUrl: 'assets/itemlimited2prgmCW.png',
                          routeName: '/product/hms-victory-hoodie',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Clothes Section 2
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'SIGNATURE RANGE',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
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
                  ],
                ),
              ),
            ),

            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'PORTSMOUTH CITY ITEMS',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: const [
                        ProductCard(
                          title: 'Portsmouth City Notebook',
                          price: '£7.00',
                          originalPrice: '£12.00',
                          imageUrl:
                              'assets/goodie2prgmCW.png',
                          routeName: '/product/notebook',
                        ),
                        ProductCard(
                          title: 'Portsmouth City Magnet',
                          price: '£3.50',
                          imageUrl:
                              'assets/goodie1prgmCW.png',
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
                          imageUrl:
                              'assets/goodie3prgmCW.png',
                          routeName: '/product/bookmark',
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/collections'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4d2963),
                          foregroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Text('VIEW ALL COLLECTIONS',
                              style: TextStyle(letterSpacing: 1)),
                        ),
                      ),
                    ),
                  ],
                ),
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
                      // Dummy link for Search
                      TextButton(
                        onPressed: () async {
                          await launchUrlString('https://dummylink.co.uk');
                        },
                        child: const Text('Search'),
                      ),
                      const SizedBox(width: 8),
                      // Dummy link for Terms & Conditions
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

// ProductCard moved to lib/product_card.dart
