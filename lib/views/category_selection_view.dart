import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proje_adi/components/quiz_flow.dart';
import '../models/country_cuisine.dart';
import '../widgets/get_started_button.dart';
import 'quiz_view.dart';

class CategorySelectionView extends StatefulWidget {
  final String countryId;
  
  const CategorySelectionView({
    super.key,
    required this.countryId,
  });

  @override
  State<CategorySelectionView> createState() => _CategorySelectionViewState();
}

class _CategorySelectionViewState extends State<CategorySelectionView> {
  final PageController _pageController = PageController(
    viewportFraction: 0.7,
    initialPage: 1, // Başlangıçta ortadaki item seçili olsun
  );
  
  int _selectedIndex = 1;

  final List<CategoryItem> categories = [
    CategoryItem(
      title: 'Çorba',
      image: 'assets/Soup.png',
      backgroundColor: const Color(0xFFFFF3E0),
    ),
    CategoryItem(
      title: 'Et Yemekleri',
      image: 'assets/Meat.png',
      backgroundColor: const Color(0xFFE8F5E9),
    ),
    CategoryItem(
      title: 'Tatlılar',
      image: 'assets/Tatli.png',
      backgroundColor: const Color(0xFFFCE4EC),
    ),
    CategoryItem(
      title: 'Sıcak İçecekler',
      image: 'assets/Coffee.png',
      backgroundColor: const Color(0xFFEFEBE9),
    ),
    CategoryItem(
      title: 'Sebze Yemekleri',
      image: 'assets/sebzze.png',
      backgroundColor: const Color(0xFFE8F5E9),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 130,
            child: Image.asset(
              'assets/category.png',
              width: double.infinity,
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: categories.length,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = index == _selectedIndex;
                
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(
                    vertical: 50,
                    horizontal: isSelected ? 20 : 40,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 400,
                        child: Image.asset(
                          category.image,
                          fit: BoxFit.contain,
                        ),
                      ),
      Text(
            categories[_selectedIndex].title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
                    ],
                  ),
                );
              },
            ),
          ),
    
          Padding(
            padding: const EdgeInsets.all(20),
            child: GetStartedButton(
              text: 'BAŞLA',
              onPressed: () {
                print('DEBUG CategorySelection: Selected category: ${categories[_selectedIndex].title}');
                print('DEBUG CategorySelection: CountryId: ${widget.countryId}');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizFlow(
                      category: categories[_selectedIndex].title,
                      countryId: widget.countryId,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem {
  final String title;
  final String image;
  final Color backgroundColor;

  CategoryItem({
    required this.title,
    required this.image,
    required this.backgroundColor,
  });
} 