import 'ingredient.dart';
import 'recipe.dart';

class QuizQuestion {
  final String id;
  final String question;
  final List<String> options;
  final int correctOptionIndex;
  final String explanation;
  final QuestionType type;
  final Recipe? relatedRecipe;
  final List<Ingredient>? givenIngredients;

  const QuizQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.correctOptionIndex,
    required this.explanation,
    required this.type,
    this.relatedRecipe,
    this.givenIngredients,
  });
}

enum QuestionType {
  ingredientSelection, // Hangi malzemeler bu yemek için gereklidir?
  recipeGuessing,     // Bu malzemelerle hangi yemek yapılabilir?
  countryGuessing,    // Bu yemek hangi ülke mutfağına aittir?
  cookingOrder,       // Bu malzemelerin doğru pişirme sırası nedir?
  difficultyGuessing  // Bu yemeğin zorluk derecesi nedir?
} 