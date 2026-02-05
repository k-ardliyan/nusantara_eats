import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nusantara_eats/widgets/category_chip.dart';

void main() {
  group('CategoryChip Widget', () {
    testWidgets('should display label text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryChip(
              label: 'Test Category',
              selected: false,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.text('Test Category'), findsOneWidget);
    });

    testWidgets('should call onTap callback when tapped', (
      WidgetTester tester,
    ) async {
      var tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryChip(
              label: 'Test Category',
              selected: false,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Test Category'));
      await tester.pump();

      expect(tapped, true);
    });

    testWidgets('should render correctly when selected', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryChip(
              label: 'Selected Category',
              selected: true,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.text('Selected Category'), findsOneWidget);
      // Find the ChoiceChip and verify it's selected
      final choiceChip = tester.widget<ChoiceChip>(find.byType(ChoiceChip));
      expect(choiceChip.selected, true);
    });

    testWidgets('should render correctly when not selected', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoryChip(
              label: 'Unselected Category',
              selected: false,
              onTap: () {},
            ),
          ),
        ),
      );

      final choiceChip = tester.widget<ChoiceChip>(find.byType(ChoiceChip));
      expect(choiceChip.selected, false);
    });
  });
}
