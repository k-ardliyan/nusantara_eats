import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nusantara_eats/models/recipe.dart';
import 'package:nusantara_eats/services/favorite_storage.dart';

void main() {
  group('FavoriteStorage', () {
    setUp(() {
      // Reset SharedPreferences before each test
      SharedPreferences.setMockInitialValues({});
    });

    test('load() should return empty set when no data exists', () async {
      final result = await FavoriteStorage.load();
      expect(result, isEmpty);
    });

    test('save() and load() should roundtrip correctly', () async {
      final idsToSave = {'id-1', 'id-2', 'id-3'};

      await FavoriteStorage.save(idsToSave);
      final loadedIds = await FavoriteStorage.load();

      expect(loadedIds, idsToSave);
    });

    test('save() should overwrite existing data', () async {
      await FavoriteStorage.save({'old-id'});
      await FavoriteStorage.save({'new-id-1', 'new-id-2'});

      final loadedIds = await FavoriteStorage.load();
      expect(loadedIds, {'new-id-1', 'new-id-2'});
      expect(loadedIds.contains('old-id'), false);
    });

    test(
      'applyToRecipes() should set isFavorite based on stored IDs',
      () async {
        // Pre-populate the storage with some favorite IDs
        await FavoriteStorage.save({'recipe-1', 'recipe-3'});

        final testRecipes = [
          Recipe(
            id: 'recipe-1',
            name: 'Recipe 1',
            origin: 'Origin',
            imageUrl: 'url',
            rating: 4.0,
            price: 10000,
            description: 'desc',
            ingredients: ['ing'],
            steps: ['step'],
          ),
          Recipe(
            id: 'recipe-2',
            name: 'Recipe 2',
            origin: 'Origin',
            imageUrl: 'url',
            rating: 4.0,
            price: 10000,
            description: 'desc',
            ingredients: ['ing'],
            steps: ['step'],
          ),
          Recipe(
            id: 'recipe-3',
            name: 'Recipe 3',
            origin: 'Origin',
            imageUrl: 'url',
            rating: 4.0,
            price: 10000,
            description: 'desc',
            ingredients: ['ing'],
            steps: ['step'],
          ),
        ];

        await FavoriteStorage.applyToRecipes(testRecipes);

        expect(testRecipes[0].isFavorite, true);
        expect(testRecipes[1].isFavorite, false);
        expect(testRecipes[2].isFavorite, true);
      },
    );

    test(
      'applyToRecipes() with no favorites should set all to false',
      () async {
        final testRecipes = [
          Recipe(
            id: 'recipe-1',
            name: 'Recipe 1',
            origin: 'Origin',
            imageUrl: 'url',
            rating: 4.0,
            price: 10000,
            description: 'desc',
            ingredients: ['ing'],
            steps: ['step'],
            isFavorite: true, // Start as true
          ),
        ];

        await FavoriteStorage.applyToRecipes(testRecipes);

        expect(testRecipes[0].isFavorite, false);
      },
    );
  });
}
