import 'package:flutter/material.dart';
import 'package:proje_adi/views/home_view.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patlıcan Mussaka Tarifi'),
        backgroundColor: Colors.green.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recipe Image
            Center(
              child: Image.asset(
                'assets/patlıcanmussaka.png',
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(height: 24),
            
            // Recipe Title
            const Text(
              'Patlıcan Mussaka Tarifi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            // Ingredients
            const Text(
              'Malzemeler:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '• 3 adet patlıcan\n'
              '• 2 adet domates\n'
              '• 2 adet biber\n'
              '• 250g kıyma\n'
              '• 1 adet soğan\n'
              '• 2 diş sarımsak\n'
              '• Tuz, karabiber\n'
              '• Sıvı yağ',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            
            // Instructions
            const Text(
              'Yapılışı:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '1. Patlıcanları alacalı soyup tuzlu suda bekletin.\n'
              '2. Domates ve biberleri küp küp doğrayın.\n'
              '3. Soğanı ve sarımsağı yemeklik doğrayın.\n'
              '4. Patlıcanları kızartın ve kağıt havlu üzerine alın.\n'
              '5. Kıymayı pişirin, soğan ve sarımsakları ekleyin.\n'
              '6. Domates ve biberleri ekleyip pişirin.\n'
              '7. Patlıcanları tepsiye dizin, üzerine kıymalı harçtan koyun.\n'
              '8. 180 derece fırında 20-25 dakika pişirin.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            
            // Complete Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeView()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Tamam',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 