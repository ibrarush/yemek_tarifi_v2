import 'ingredient.dart';

class Recipe {
  final String id;
  final String name;
  final String country;
  final String category; // çorba, sebze yemeği, et yemeği, tatlı, sıcak içecek
  final String image;
  final List<Ingredient> ingredients;
  final String description;
  final int cookingTime;
  final int difficulty; // 1-5 arası zorluk derecesi

  const Recipe({
    required this.id,
    required this.name,
    required this.country,
    required this.category,
    required this.image,
    required this.ingredients,
    required this.description,
    required this.cookingTime,
    required this.difficulty,
  });

  // Verilen malzemelerle bu yemek yapılabilir mi kontrolü
  bool canBeMadeWith(List<Ingredient> availableIngredients) {
    return ingredients.every((ingredient) => 
      availableIngredients.any((available) => available.id == ingredient.id)
    );
  }

  // Eksik malzemeleri bulma
  List<Ingredient> missingIngredients(List<Ingredient> availableIngredients) {
    return ingredients.where((ingredient) => 
      !availableIngredients.any((available) => available.id == ingredient.id)
    ).toList();
  }
} 