import 'package:flutter_test/flutter_test.dart';
import 'package:nusantara_eats/data/recipe_data.dart';

void main() {
  group('Recipe Data', () {
    test('recipes list should not be empty', () {
      expect(recipes, isNotEmpty);
    });

    test('all recipes should have unique IDs', () {
      final ids = recipes.map((r) => r.id).toList();
      final uniqueIds = ids.toSet();
      expect(
        uniqueIds.length,
        ids.length,
        reason: 'Found duplicate IDs in recipes list',
      );
    });

    test('all recipes should have valid ratings between 1.0 and 5.0', () {
      for (final recipe in recipes) {
        expect(
          recipe.rating,
          greaterThanOrEqualTo(1.0),
          reason: 'Recipe ${recipe.id} has rating below 1.0',
        );
        expect(
          recipe.rating,
          lessThanOrEqualTo(5.0),
          reason: 'Recipe ${recipe.id} has rating above 5.0',
        );
      }
    });

    test('all recipes should have positive prices', () {
      for (final recipe in recipes) {
        expect(
          recipe.price,
          greaterThan(0),
          reason: 'Recipe ${recipe.id} has non-positive price',
        );
      }
    });

    test('all recipes should have non-empty names', () {
      for (final recipe in recipes) {
        expect(
          recipe.name,
          isNotEmpty,
          reason: 'Recipe ${recipe.id} has empty name',
        );
      }
    });

    test('all recipes should have at least one ingredient', () {
      for (final recipe in recipes) {
        expect(
          recipe.ingredients,
          isNotEmpty,
          reason: 'Recipe ${recipe.id} has no ingredients',
        );
      }
    });

    test('all recipes should have at least one step', () {
      for (final recipe in recipes) {
        expect(
          recipe.steps,
          isNotEmpty,
          reason: 'Recipe ${recipe.id} has no steps',
        );
      }
    });
  });
}
