import 'package:flutter/material.dart';
import 'quiz_drag_drop.dart';
import '../services/mock_quiz_service.dart';
import '../models/quiz_question.dart';
import '../widgets/quiz_navigation_button.dart';

class QuizFlow extends StatefulWidget {
  final String category;
  final String countryId;

  const QuizFlow({
    super.key,
    required this.category,
    required this.countryId,
  });

  @override
  State<QuizFlow> createState() => _QuizFlowState();
}

class _QuizFlowState extends State<QuizFlow> {
  int currentQuestionIndex = 0;
  int score = 0;
  late final List<QuizQuestion> questions;
  String? selectedAnswer;
  bool hasAnswered = false;

  @override
  void initState() {
    super.initState();
    questions = MockQuizService.getQuestionsForCountryAndCategory(
      widget.countryId,
      widget.category,
    );
  }

  void _checkAnswer(String answer) {
    if (hasAnswered) return;
    
    setState(() {
      selectedAnswer = answer;
      hasAnswered = true;
      
      final isCorrect = answer == questions[currentQuestionIndex].options[questions[currentQuestionIndex].correctOptionIndex];
      if (isCorrect) {
        score += 50;
      }
    });
  }

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
        hasAnswered = false;
      });
    } else {
      // Navigate to drag-drop quiz
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const QuizDragDrop()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text('Bu kategori için soru bulunmamaktadır.'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Header with back button and score
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.amber[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text('$score+',
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: Colors.green[100],
                    child: Text('${currentQuestionIndex + 1}',
                        style: const TextStyle(color: Colors.black)),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              
              // Question
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 32),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF6E2),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Text(
                  questions[currentQuestionIndex].question,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              // Answer options
              Expanded(
                child: ListView.builder(
                  itemCount: questions[currentQuestionIndex].options.length,
                  itemBuilder: (context, index) {
                    final option = questions[currentQuestionIndex].options[index];
                    final isSelected = selectedAnswer == option;
                    final isCorrect = option == questions[currentQuestionIndex].options[questions[currentQuestionIndex].correctOptionIndex];
                    
                    Color backgroundColor = Colors.white;
                    if (hasAnswered) {
                      if (isSelected) {
                        backgroundColor = isCorrect ? const Color(0xFF8DC63F) : const Color(0xFFECCDCD);
                      } else if (isCorrect) {
                        backgroundColor = const Color(0xFF8DC63F);
                      }
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: InkWell(
                        onTap: () => _checkAnswer(option),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: isSelected ? Colors.green : Colors.grey.shade300,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected ? Colors.green : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Next button or explanation
              if (hasAnswered)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEAF6E2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          questions[currentQuestionIndex].explanation,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 16),
                      QuizNavigationButton(
                        isCorrect: selectedAnswer == questions[currentQuestionIndex].options[questions[currentQuestionIndex].correctOptionIndex],
                        questionNumber: currentQuestionIndex,
                        onPressed: _nextQuestion,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
} 