import 'recipe.dart';

class CountryCuisine {
  final String id;
  final String name;
  final String flag; // SVG path
  final Map<String, List<Recipe>> recipesByCategory; // category -> recipes

  const CountryCuisine({
    required this.id,
    required this.name,
    required this.flag,
    required this.recipesByCategory,
  });

  List<Recipe> getRecipesByCategory(String category) {
    return recipesByCategory[category] ?? [];
  }

  List<Recipe> get allRecipes {
    return recipesByCategory.values.expand((recipes) => recipes).toList();
  }

  // Kategoriler: çorba, sebze yemeği, et yemeği, tatlı, sıcak içecek
  static const categories = [
    'Çorba',
    'Sebze Yemeği',
    'Et Yemeği',
    'Tatlı',
    'Sıcak İçecek',
  ];
} 