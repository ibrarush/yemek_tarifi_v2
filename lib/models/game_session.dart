import 'ingredient.dart';
import 'quiz_question.dart';

class GameSession {
  final String id;
  final String countryId;
  final String categoryId;
  List<Ingredient> selectedIngredients;
  List<QuizQuestion> questions;
  List<int> answers;
  int currentQuestionIndex;
  int score;
  bool isCompleted;

  GameSession({
    required this.id,
    required this.countryId,
    required this.categoryId,
    this.selectedIngredients = const [],
    this.questions = const [],
    this.answers = const [],
    this.currentQuestionIndex = 0,
    this.score = 0,
    this.isCompleted = false,
  });

  bool get canProceedToNextQuestion => 
    currentQuestionIndex < questions.length - 1;

  void answerQuestion(int answerIndex) {
    if (isCompleted) return;

    answers.add(answerIndex);
    if (answerIndex == questions[currentQuestionIndex].correctOptionIndex) {
      score += 10;
    }

    if (!canProceedToNextQuestion) {
      isCompleted = true;
    } else {
      currentQuestionIndex++;
    }
  }

  void selectIngredient(Ingredient ingredient) {
    if (!selectedIngredients.contains(ingredient)) {
      selectedIngredients.add(ingredient);
    }
  }

  void removeIngredient(Ingredient ingredient) {
    selectedIngredients.remove(ingredient);
  }
} 