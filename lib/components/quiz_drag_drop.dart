import 'package:flutter/material.dart';
import '../screens/recipe_screen.dart';

class QuizDragDrop extends StatefulWidget {
  const QuizDragDrop({super.key});

  @override
  State<QuizDragDrop> createState() => _QuizDragDropState();
}

class _QuizDragDropState extends State<QuizDragDrop> {
  List<Map<String, dynamic>> droppedItems = [];
  final GlobalKey _panKey = GlobalKey();
  bool isCorrectSequence = true;
  String? errorMessage;

  // Map to store the corresponding "just_" image for each main image
  final Map<String, String> imageToJustImage = {
    'assets/patlıcan.png': 'assets/just_patlıcan.png',
    'assets/domates.png': 'assets/just_domates.png',
    'assets/biber.png': 'assets/just_biber.png',
  };

  // Correct sequence of ingredients
  final List<String> correctSequence = [
    'assets/patlıcan.png',
    'assets/domates.png',
    'assets/biber.png',
  ];

  void checkSequence() {
    if (droppedItems.length == 3) {
      bool isCorrect = true;
      for (int i = 0; i < 3; i++) {
        if (droppedItems[i]['imagePath'] != correctSequence[i]) {
          isCorrect = false;
          break;
        }
      }
      setState(() {
        isCorrectSequence = isCorrect;
        if (!isCorrect) {
          errorMessage = 'Yanlış sıralama! Doğru sıralama: Patlıcan -> Domates -> Biber';
        } else {
          errorMessage = null;
        }
      });
    }
  }

  void resetState() {
    setState(() {
      droppedItems = [];
      isCorrectSequence = true;
      errorMessage = null;
    });
  }

  void navigateToRecipe() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RecipeScreen()),
    );
  }

  bool _isPointInsidePan(Offset point) {
    final RenderBox renderBox = _panKey.currentContext!.findRenderObject() as RenderBox;
    final localPosition = renderBox.globalToLocal(point);
    return localPosition.dx >= 0 && 
           localPosition.dx <= renderBox.size.width && 
           localPosition.dy >= 0 && 
           localPosition.dy <= renderBox.size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header with back button and score
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text(
                          '1550+',
                          style: TextStyle(
                            color: Colors.green.shade900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: Colors.pink.shade100,
                    child: Text(
                      '120',
                      style: TextStyle(
                        color: Colors.pink.shade900,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Quiz items at the top
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 124,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildQuizItem('assets/patlıcan.png', 'assets/just_patlıcan.png'),
                    const SizedBox(width: 16),
                    _buildQuizItem('assets/domates.png', 'assets/just_domates.png'),
                    const SizedBox(width: 16),
                    _buildQuizItem('assets/biber.png', 'assets/just_biber.png'),
                  ],
                ),
              ),
            ),
            // Main content area
            Expanded(
              child: Stack(
                children: [
                  // Patlıcan Mussaka text container
                  if (droppedItems.length >= 3 && isCorrectSequence)
                    Positioned(
                      top: 20,
                      left: 0,
                      right: 0,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDAECCD),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Text(
                          'Patlıcan Mussaka',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  // Drop target (pan)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: DragTarget<String>(
                      builder: (context, candidateData, rejectedData) {
                        return Container(
                          key: _panKey,
                          width: 400,
                          height: 450,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Image.asset(
                                  'assets/tava.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              if (droppedItems.length >= 3 && isCorrectSequence)
                               Positioned(
  left: 150,
  top: 90,
  child: ClipOval(
    child: Image.asset(
      'assets/patlıcanmussakav2.png',
      width: 120,
      height: 120,
      fit: BoxFit.cover, // Görselin daire içine düzgün sığması için
    ),
  ),
)
                              else
                                ...droppedItems.map((item) => Positioned(
                                  left: item['position'].dx,
                                  top: item['position'].dy,
                                  child: Image.asset(
                                    imageToJustImage[item['imagePath']] ?? item['imagePath'],
                                    width: 50,
                                    height: 50,
                                  ),
                                )).toList(),
                            ],
                          ),
                        );
                      },
                      onWillAccept: (data) => droppedItems.length < 3,
                      onAcceptWithDetails: (details) {
                        if (_isPointInsidePan(details.offset)) {
                          final RenderBox renderBox = _panKey.currentContext!.findRenderObject() as RenderBox;
                          final localPosition = renderBox.globalToLocal(details.offset);
                          
                          setState(() {
                            droppedItems.add({
                              'position': localPosition,
                              'imagePath': details.data,
                            });
                            checkSequence();
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Complete button
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  if (errorMessage != null)
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.error_outline, color: Colors.red.shade900),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              errorMessage!,
                              style: TextStyle(
                                color: Colors.red.shade900,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: resetState,
                            child: const Text(
                              'Yenile',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          '160',
                          style: TextStyle(
                            color: Colors.green.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: droppedItems.length == 3 ? 
                            (isCorrectSequence ? navigateToRecipe : resetState) : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isCorrectSequence ? Colors.green : Colors.red,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            isCorrectSequence ? 'Tarife Git' : 'Yeniden Dene',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizItem(String imagePath, String dragImagePath) {
    return Draggable<String>(
      data: imagePath,
      feedback: Container(
        width: 30,
        height: 30,
        child: Image.asset(dragImagePath),
      ),
      childWhenDragging: Container(
        width: 124,
        height: 124,
        child: Image.asset(imagePath),
      ),
      child: Container(
        width: 124,
        height: 124,
        child: Image.asset(imagePath),
      ),
    );
  }
} 