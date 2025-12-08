class Recipe {
  Recipe({
    required this.id,
    required this.name,
    required this.origin,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.description,
    required this.ingredients,
    required this.steps,
    this.isFavorite = false,
  });

  final String id;
  final String name;
  final String origin;
  final String imageUrl;
  final double rating; // 1.0 - 5.0
  final int price; // in Rupiah
  final String description;
  final List<String> ingredients;
  final List<String> steps;
  bool isFavorite;
}
