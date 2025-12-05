import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Signature Range Collection Tests', () {
    testWidgets('signature collection shows all signature range items',
        (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to collections
      await tester.tap(find.text('VIEW ALL COLLECTIONS'));
      await tester.pumpAndSettle();

      // Tap the Signature Range card
      await tester.tap(find.text('Signature Range'));
      await tester.pumpAndSettle();

      // Check that signature items are present on signature page
      expect(find.text('University of Portsmouth Sweatshirt'), findsOneWidget);
      expect(find.text('University of Portsmouth T-Shirt'), findsOneWidget);
      expect(find.text('University of Portsmouth Hoodie'), findsOneWidget);
      expect(find.text('University of Portsmouth Cap'), findsOneWidget);
    });
  });
}
