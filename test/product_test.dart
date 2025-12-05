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
      expect(find.textContaining('Opening Hours'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Terms & Conditions'), findsOneWidget);
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

    testWidgets('sweatshirt page shows Size and Colour dropdowns',
        (tester) async {
      await tester.pumpWidget(createTestWidget(productId: 'sweatshirt'));
      await tester.pumpAndSettle();

      expect(find.byType(DropdownButton<String>), findsNWidgets(2));
      expect(find.text('M'), findsOneWidget);
      expect(find.text('Black'), findsOneWidget);
    });

    testWidgets('t-shirt page shows Size and Colour dropdowns', (tester) async {
      await tester.pumpWidget(createTestWidget(productId: 't-shirt'));
      await tester.pumpAndSettle();

      expect(find.byType(DropdownButton<String>), findsNWidgets(2));
      expect(find.text('M'), findsOneWidget);
      expect(find.text('Black'), findsOneWidget);
    });

    testWidgets('cap page shows Size and Colour dropdowns', (tester) async {
      await tester.pumpWidget(createTestWidget(productId: 'cap'));
      await tester.pumpAndSettle();

      expect(find.byType(DropdownButton<String>), findsNWidgets(2));
      expect(find.text('M'), findsOneWidget);
      expect(find.text('Black'), findsOneWidget);
    });

    testWidgets('hms-victory-hoodie page shows Size and Colour dropdowns',
        (tester) async {
      await tester
          .pumpWidget(createTestWidget(productId: 'hms-victory-hoodie'));
      await tester.pumpAndSettle();

      expect(find.byType(DropdownButton<String>), findsNWidgets(2));
      expect(find.text('M'), findsOneWidget);
      expect(find.text('Black'), findsOneWidget);
    });

    testWidgets('hms-victory-mug page shows populated info', (tester) async {
      await tester.pumpWidget(createTestWidget(productId: 'hms-victory-mug'));
      await tester.pumpAndSettle();

      expect(find.text('University of Portsmouth HMS Victory Mug'),
          findsOneWidget);
      expect(find.text('£16.00'), findsOneWidget);
      expect(find.textContaining('commemorative HMS Victory ceramic mug'),
          findsOneWidget);
    });

    testWidgets('notebook page shows populated info', (tester) async {
      await tester.pumpWidget(createTestWidget(productId: 'notebook'));
      await tester.pumpAndSettle();

      expect(find.text('Portsmouth City Notebook'), findsOneWidget);
      expect(find.text('£7.00'), findsOneWidget);
      expect(find.textContaining('handy Portsmouth City notebook'),
          findsOneWidget);
    });

    testWidgets('magnet_1 page shows populated info', (tester) async {
      await tester.pumpWidget(createTestWidget(productId: 'magnet_1'));
      await tester.pumpAndSettle();

      expect(find.text('Portsmouth City Magnet'), findsOneWidget);
      expect(find.text('£3.50'), findsOneWidget);
      expect(
          find.textContaining('small Portsmouth City magnet'), findsOneWidget);
    });

    testWidgets('magnet_2 page shows populated info', (tester) async {
      await tester.pumpWidget(createTestWidget(productId: 'magnet_2'));
      await tester.pumpAndSettle();

      expect(find.text('Portsmouth City Magnet (Large)'), findsOneWidget);
      expect(find.text('£5.00'), findsOneWidget);
      expect(
          find.textContaining('larger Portsmouth City magnet'), findsOneWidget);
    });

    testWidgets('bookmark page shows populated info', (tester) async {
      await tester.pumpWidget(createTestWidget(productId: 'bookmark'));
      await tester.pumpAndSettle();

      expect(find.text('Portsmouth City Bookmark'), findsOneWidget);
      expect(find.text('£2.50'), findsOneWidget);
      expect(find.textContaining('themed bookmark showcasing Portsmouth City'),
          findsOneWidget);
    });
  });
}
