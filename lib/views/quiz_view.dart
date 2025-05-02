import 'package:flutter/material.dart';
import '../models/quiz_question.dart';
import '../services/mock_quiz_service.dart';
import '../widgets/quiz_navigation_button.dart';

class QuizView extends StatefulWidget {
  final String category;
  final String countryId;

  const QuizView({
    super.key,
    required this.category,
    required this.countryId,
  });

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  int currentQuestionIndex = 0;
  int score = 0;
  late final List<QuizQuestion> questions;
  String? selectedAnswer;
  bool hasAnswered = false;

  @override
  void initState() {
    super.initState();
    print('DEBUG: Category: ${widget.category}, CountryId: ${widget.countryId}');
    questions = MockQuizService.getQuestionsForCountryAndCategory(
      widget.countryId,
      widget.category,
    );
    print('DEBUG: Questions length: ${questions.length}');
    print('DEBUG: Available questions: $questions');
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
              // Üst bilgi çubuğu
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
              
              // Soru
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
              
              // Cevap seçenekleri
              Expanded(
                child: Column(
                  children: questions[currentQuestionIndex].options.map((option) {
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
                      child: Center(
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.9,
                          ),
                          child: IntrinsicWidth(
                            child: ElevatedButton(
                              onPressed: () => _checkAnswer(option),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: backgroundColor,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 20,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  side: BorderSide(
                                    color: hasAnswered && isCorrect ? const Color(0xFF8DC63F) : const Color(0xFFE0E0E0),
                                  ),
                                ),
                                elevation: 0,
                                shadowColor: const Color(0xFFEAF6E2),
                              ).copyWith(
                                elevation: MaterialStateProperty.resolveWith<double>(
                                  (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.pressed)) {
                                      return 0;
                                    }
                                    return 4;
                                  },
                                ),
                              ),
                              child: Text(
                                option,
                                style: TextStyle(
                                  color: hasAnswered && isSelected ? Colors.white : Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              
              // Alt bilgi ve İleri butonu
              if (hasAnswered)
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: QuizNavigationButton(
                    isCorrect: selectedAnswer == questions[currentQuestionIndex].options[questions[currentQuestionIndex].correctOptionIndex],
                    questionNumber: currentQuestionIndex,
                    onPressed: _nextQuestion,
                  ),
                )
              else
                const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
} 