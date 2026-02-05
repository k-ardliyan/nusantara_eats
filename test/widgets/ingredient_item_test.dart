import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nusantara_eats/widgets/ingredient_item.dart';

void main() {
  group('IngredientItem Widget', () {
    testWidgets('should display ingredient text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: IngredientItem(text: '500g daging sapi')),
        ),
      );

      expect(find.text('500g daging sapi'), findsOneWidget);
    });

    testWidgets('should display bullet point indicator', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: IngredientItem(text: 'Test ingredient')),
        ),
      );

      // Find the circular container that acts as bullet point
      final containers = find.byType(Container);
      expect(containers, findsWidgets);
    });

    testWidgets('should render with empty text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: IngredientItem(text: '')),
        ),
      );

      // Should render without error
      expect(find.byType(IngredientItem), findsOneWidget);
    });

    testWidgets('should render with long text', (WidgetTester tester) async {
      final longText =
          'This is a very long ingredient description that should wrap properly and not cause any overflow issues in the widget layout';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(width: 300, child: IngredientItem(text: longText)),
          ),
        ),
      );

      expect(find.text(longText), findsOneWidget);
    });
  });
}
