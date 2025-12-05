import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Home Page Tests', () {
    testWidgets('should display home page with basic elements', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that basic UI elements are present
      expect(find.textContaining('BIG SALE!'), findsOneWidget);
      expect(find.text('PORTSMOUTH CITY COLLECTION'), findsOneWidget);
      expect(find.text('BROWSE PRODUCTS'), findsOneWidget);
      expect(find.text('VIEW ALL COLLECTIONS'), findsOneWidget);
      // About Us at the top-right
      expect(find.text('About Us'), findsOneWidget);
    });

    testWidgets('should display product cards', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that product cards are displayed (representative)
      expect(find.text('University of Portsmouth HMS Victory Mug'),
          findsOneWidget);
      expect(find.text('University of Portsmouth Hoodie'), findsOneWidget);
      expect(find.text('University of Portsmouth T-Shirt'), findsOneWidget);
      expect(find.text('University of Portsmouth Cap'), findsOneWidget);
    });

    testWidgets('should display header icons', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that header icons are present
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that footer is present
      expect(find.text('Placeholder Footer'), findsOneWidget);
    });

    testWidgets('about us button navigates to about page', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      final aboutFinder = find.text('About Us');
      expect(aboutFinder, findsOneWidget);

      await tester.tap(aboutFinder);
      await tester.pumpAndSettle();

      expect(find.text('About Us'),
          findsWidgets); // AppBar title + button text both contain 'About Us'
      expect(find.textContaining('Welcome to the Union Shop!'), findsOneWidget);
    });
  });
}
