import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Collections Page Tests', () {
    testWidgets('shows three collection cards and navigates', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to collections
      await tester.tap(find.text('VIEW ALL COLLECTIONS'));
      await tester.pumpAndSettle();

      // Check the three collection titles are present
      expect(find.text('Sales Collections'), findsOneWidget);
      expect(find.text('Signature Range'), findsOneWidget);
      expect(find.text('Portsmouth City Items'), findsOneWidget);

      // Tap Sales Collections card and verify navigation
      await tester.tap(find.text('Sales Collections'));
      await tester.pumpAndSettle();

      // Check that sale items are shown on the Sales page (HMS Victory items + discounted notebook)
      expect(find.text('University of Portsmouth HMS Victory Mug'),
          findsOneWidget);
      expect(find.text('University of Portsmouth HMS Victory Hoodie'),
          findsOneWidget);
      // Discounted notebook should also be present
      expect(find.text('Portsmouth City Notebook'), findsOneWidget);
      // Also check the non-functional dropdowns exist on the page and chips removed
      expect(find.byType(DropdownButtonFormField<String>), findsNWidgets(2));
      expect(find.byType(FilterChip), findsNothing);

      // Go back and tap the Portsmouth City Items card
      await tester.pageBack();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Portsmouth City Items'));
      await tester.pumpAndSettle();

      // Check that Portsmouth items are present
      expect(find.text('Portsmouth City Notebook'), findsOneWidget);
      expect(find.text('Portsmouth City Magnet'), findsOneWidget);
      expect(find.text('Portsmouth City Magnet (Large)'), findsOneWidget);
      // Verify dropdowns present and chips removed on the Portsmouth page
      expect(find.byType(DropdownButtonFormField<String>), findsNWidgets(2));
      expect(find.byType(FilterChip), findsNothing);
      expect(find.text('Portsmouth City Bookmark'), findsOneWidget);
    });
  });
}
