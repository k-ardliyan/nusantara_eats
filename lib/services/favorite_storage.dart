import 'package:shared_preferences/shared_preferences.dart';

import '../data/recipe_data.dart';
import '../models/recipe.dart';

class FavoriteStorage {
  const FavoriteStorage._();

  static const _key = 'favorite_ids';

  static Future<Set<String>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key);
    return list?.toSet() ?? <String>{};
  }

  static Future<void> save(Set<String> ids) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, ids.toList());
  }

  static Future<void> applyToRecipes(List<Recipe> items) async {
    final ids = await load();
    for (final recipe in items) {
      recipe.isFavorite = ids.contains(recipe.id);
    }
  }

  static Future<void> updateFavorite(String id, bool isFavorite) async {
    final ids = await load();
    if (isFavorite) {
      ids.add(id);
    } else {
      ids.remove(id);
    }
    await save(ids);
    for (final recipe in recipes) {
      if (recipe.id == id) {
        recipe.isFavorite = isFavorite;
        break;
      }
    }
  }
}
