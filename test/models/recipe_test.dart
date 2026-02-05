import 'package:flutter_test/flutter_test.dart';
import 'package:nusantara_eats/models/recipe.dart';

void main() {
  group('Recipe Model', () {
    test('should create a Recipe with all required properties', () {
      final recipe = Recipe(
        id: 'test-id',
        name: 'Test Recipe',
        origin: 'Test Origin',
        imageUrl: 'https://example.com/image.jpg',
        rating: 4.5,
        price: 50000,
        description: 'Test description',
        ingredients: ['Ingredient 1', 'Ingredient 2'],
        steps: ['Step 1', 'Step 2'],
      );

      expect(recipe.id, 'test-id');
      expect(recipe.name, 'Test Recipe');
      expect(recipe.origin, 'Test Origin');
      expect(recipe.imageUrl, 'https://example.com/image.jpg');
      expect(recipe.rating, 4.5);
      expect(recipe.price, 50000);
      expect(recipe.description, 'Test description');
      expect(recipe.ingredients, ['Ingredient 1', 'Ingredient 2']);
      expect(recipe.steps, ['Step 1', 'Step 2']);
    });

    test('should have isFavorite default to false', () {
      final recipe = Recipe(
        id: 'test-id',
        name: 'Test Recipe',
        origin: 'Test Origin',
        imageUrl: 'https://example.com/image.jpg',
        rating: 4.5,
        price: 50000,
        description: 'Test description',
        ingredients: [],
        steps: [],
      );

      expect(recipe.isFavorite, false);
    });

    test('should allow isFavorite to be set via constructor', () {
      final recipe = Recipe(
        id: 'test-id',
        name: 'Test Recipe',
        origin: 'Test Origin',
        imageUrl: 'https://example.com/image.jpg',
        rating: 4.5,
        price: 50000,
        description: 'Test description',
        ingredients: [],
        steps: [],
        isFavorite: true,
      );

      expect(recipe.isFavorite, true);
    });

    test('should allow isFavorite to be mutated', () {
      final recipe = Recipe(
        id: 'test-id',
        name: 'Test Recipe',
        origin: 'Test Origin',
        imageUrl: 'https://example.com/image.jpg',
        rating: 4.5,
        price: 50000,
        description: 'Test description',
        ingredients: [],
        steps: [],
      );

      expect(recipe.isFavorite, false);

      recipe.isFavorite = true;
      expect(recipe.isFavorite, true);

      recipe.isFavorite = false;
      expect(recipe.isFavorite, false);
    });
  });
}
