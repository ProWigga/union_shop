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

      expect(find.text('Sales Collections'), findsWidgets);
      expect(
          find.textContaining('Welcome to Sales Collections'), findsOneWidget);
    });
  });
}
