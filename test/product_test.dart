import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/product_page.dart';

void main() {
  group('Product Page Tests', () {
    Widget createTestWidget({String? productId}) {
      return MaterialApp(home: ProductPage(productId: productId));
    }

    testWidgets('should display product page with basic elements', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that basic UI elements are present
      expect(find.text('PLACEHOLDER HEADER TEXT'), findsOneWidget);
      expect(find.text('Placeholder Product Name'), findsOneWidget);
      expect(find.text('£15.00'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
    });

    testWidgets('should display placeholder description when no product id',
        (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that placeholder description is present when productId not provided
      expect(
          find.textContaining(
              'This is a placeholder description for the product.'),
          findsOneWidget);
    });

    testWidgets('should display header icons', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that header icons are present
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that footer is present
      expect(find.text('Placeholder Footer'), findsOneWidget);
    });

    testWidgets('hoodie page shows Size and Colour dropdowns', (tester) async {
      await tester.pumpWidget(createTestWidget(productId: 'hoodie'));
      await tester.pumpAndSettle();

      // There should be two dropdown buttons for size + colour
      expect(find.byType(DropdownButton<String>), findsNWidgets(2));

      // Defaults should be present in the dropdown (M for size, Black for colour)
      expect(find.text('M'), findsOneWidget);
      expect(find.text('Black'), findsOneWidget);
    });
  });
}
