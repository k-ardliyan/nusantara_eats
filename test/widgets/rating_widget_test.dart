import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nusantara_eats/widgets/rating_widget.dart';

void main() {
  group('RatingWidget', () {
    testWidgets('should display 5 star icons', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: RatingWidget(rating: 3.0))),
      );

      // Should have 5 stars total
      final starIcons = find.byType(Icon);
      expect(starIcons, findsNWidgets(5));
    });

    testWidgets('should show correct filled stars for rating 4.0', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: RatingWidget(rating: 4.0))),
      );

      // Find filled stars
      final filledStars = find.byIcon(Icons.star);
      expect(filledStars, findsNWidgets(4));

      // Find empty stars
      final emptyStars = find.byIcon(Icons.star_border);
      expect(emptyStars, findsNWidgets(1));
    });

    testWidgets('should show half star for rating 3.5', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: RatingWidget(rating: 3.5))),
      );

      // Find filled stars (3)
      final filledStars = find.byIcon(Icons.star);
      expect(filledStars, findsNWidgets(3));

      // Find half star (1)
      final halfStars = find.byIcon(Icons.star_half);
      expect(halfStars, findsNWidgets(1));

      // Find empty stars (1)
      final emptyStars = find.byIcon(Icons.star_border);
      expect(emptyStars, findsNWidgets(1));
    });

    testWidgets('should show all empty stars for rating 0.0', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: RatingWidget(rating: 0.0))),
      );

      final emptyStars = find.byIcon(Icons.star_border);
      expect(emptyStars, findsNWidgets(5));
    });

    testWidgets('should show all filled stars for rating 5.0', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: RatingWidget(rating: 5.0))),
      );

      final filledStars = find.byIcon(Icons.star);
      expect(filledStars, findsNWidgets(5));
    });

    testWidgets('should use custom size when provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: RatingWidget(rating: 3.0, size: 24)),
        ),
      );

      final icons = tester.widgetList<Icon>(find.byType(Icon));
      for (final icon in icons) {
        expect(icon.size, 24);
      }
    });

    testWidgets('should use default size of 16 when not provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: RatingWidget(rating: 3.0))),
      );

      final icons = tester.widgetList<Icon>(find.byType(Icon));
      for (final icon in icons) {
        expect(icon.size, 16);
      }
    });
  });
}
