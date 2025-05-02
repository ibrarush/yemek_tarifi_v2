import '../models/ingredient.dart';
import '../models/recipe.dart';
import '../models/country_cuisine.dart';
import '../models/quiz_question.dart';

// Malzemeler
final ingredients = {
  // Sebzeler
  'patlican': Ingredient(id: 'patlican', name: 'Patlıcan', image: 'assets/vegetables/patlican.svg', category: 'Sebze'),
  'domates': Ingredient(id: 'domates', name: 'Domates', image: 'assets/vegetables/domates.svg', category: 'Sebze'),
  'biber': Ingredient(id: 'biber', name: 'Biber', image: 'assets/vegetables/biber.svg', category: 'Sebze'),
  'sogan': Ingredient(id: 'sogan', name: 'Soğan', image: 'assets/vegetables/sogan.svg', category: 'Sebze'),
  'sarımsak': Ingredient(id: 'sarımsak', name: 'Sarımsak', image: 'assets/vegetables/sarimsak.svg', category: 'Sebze'),
  'havuc': Ingredient(id: 'havuc', name: 'Havuç', image: 'assets/vegetables/havuc.svg', category: 'Sebze'),
  'kabak': Ingredient(id: 'kabak', name: 'Kabak', image: 'assets/vegetables/kabak.svg', category: 'Sebze'),
  'ispanak': Ingredient(id: 'ispanak', name: 'Ispanak', image: 'assets/vegetables/ispanak.svg', category: 'Sebze'),
  'mantar': Ingredient(id: 'mantar', name: 'Mantar', image: 'assets/vegetables/mantar.svg', category: 'Sebze'),
  
  // Et ve Süt Ürünleri
  'kıyma': Ingredient(id: 'kıyma', name: 'Kıyma', image: 'assets/meat/kiyma.svg', category: 'Et'),
  'tavuk': Ingredient(id: 'tavuk', name: 'Tavuk', image: 'assets/meat/tavuk.svg', category: 'Et'),
  'peynir': Ingredient(id: 'peynir', name: 'Peynir', image: 'assets/dairy/peynir.svg', category: 'Süt Ürünü'),
  
  // Bakliyat
  'pirinc': Ingredient(id: 'pirinc', name: 'Pirinç', image: 'assets/grains/pirinc.svg', category: 'Bakliyat'),
  'mercimek': Ingredient(id: 'mercimek', name: 'Mercimek', image: 'assets/grains/mercimek.svg', category: 'Bakliyat'),
  'noodle': Ingredient(id: 'noodle', name: 'Noodle', image: 'assets/grains/noodle.svg', category: 'Bakliyat'),
};

// Türk Mutfağı Tarifleri
final turkishRecipes = {
  'karniyarik': Recipe(
    id: 'karniyarik',
    name: 'Karnıyarık',
    country: 'Türkiye',
    category: 'Sebze Yemeği',
    image: 'assets/recipes/karniyarik.svg',
    ingredients: [
      ingredients['patlican']!,
      ingredients['kıyma']!,
      ingredients['domates']!,
      ingredients['biber']!,
      ingredients['sogan']!,
    ],
    description: 'Patlıcan içine kıymalı harç konularak yapılan geleneksel Türk yemeği',
    cookingTime: 45,
    difficulty: 3,
  ),
  'mercimek': Recipe(
    id: 'mercimek',
    name: 'Mercimek Çorbası',
    country: 'Türkiye',
    category: 'Çorba',
    image: 'assets/recipes/mercimek.svg',
    ingredients: [
      ingredients['mercimek']!,
      ingredients['sogan']!,
      ingredients['havuc']!,
      ingredients['sarımsak']!,
    ],
    description: 'Kırmızı mercimek ile yapılan besleyici çorba',
    cookingTime: 30,
    difficulty: 2,
  ),
};

// İtalyan Mutfağı Tarifleri
final italianRecipes = {
  'mushroom_pasta': Recipe(
    id: 'mushroom_pasta',
    name: 'Mantarlı Makarna',
    country: 'İtalya',
    category: 'Sebze Yemeği',
    image: 'assets/recipes/mushroom_pasta.svg',
    ingredients: [
      ingredients['mantar']!,
      ingredients['sarımsak']!,
      ingredients['peynir']!,
    ],
    description: 'Kremalı mantarlı İtalyan makarnası',
    cookingTime: 25,
    difficulty: 2,
  ),
};

// Japon Mutfağı Tarifleri
final japaneseRecipes = {
  'ramen': Recipe(
    id: 'ramen',
    name: 'Ramen',
    country: 'Japonya',
    category: 'Çorba',
    image: 'assets/recipes/ramen.svg',
    ingredients: [
      ingredients['noodle']!,
      ingredients['tavuk']!,
      ingredients['sogan']!,
      ingredients['mantar']!,
    ],
    description: 'Geleneksel Japon noodle çorbası',
    cookingTime: 40,
    difficulty: 4,
  ),
};

// Hint Mutfağı Tarifleri
final indianRecipes = {
  'curry': Recipe(
    id: 'curry',
    name: 'Sebzeli Körri',
    country: 'Hindistan',
    category: 'Sebze Yemeği',
    image: 'assets/recipes/curry.svg',
    ingredients: [
      ingredients['patlican']!,
      ingredients['domates']!,
      ingredients['sogan']!,
      ingredients['sarımsak']!,
      ingredients['biber']!,
    ],
    description: 'Hint baharatları ile hazırlanan sebzeli körri',
    cookingTime: 35,
    difficulty: 3,
  ),
};

// Ülke Mutfakları
final countryCuisines = [
  CountryCuisine(
    id: 'turkiye',
    name: 'Türkiye',
    flag: 'assets/turkey.svg',
    recipesByCategory: {
      'Çorba': [turkishRecipes['mercimek']!],
      'Sebze Yemeği': [turkishRecipes['karniyarik']!],
    },
  ),
  CountryCuisine(
    id: 'italya',
    name: 'İtalya',
    flag: 'assets/italy.svg',
    recipesByCategory: {
      'Sebze Yemeği': [italianRecipes['mushroom_pasta']!],
    },
  ),
  CountryCuisine(
    id: 'japonya',
    name: 'Japonya',
    flag: 'assets/japan.svg',
    recipesByCategory: {
      'Çorba': [japaneseRecipes['ramen']!],
    },
  ),
  CountryCuisine(
    id: 'hindistan',
    name: 'Hindistan',
    flag: 'assets/hint.svg',
    recipesByCategory: {
      'Sebze Yemeği': [indianRecipes['curry']!],
    },
  ),
];

// Örnek Quiz Soruları
final sampleQuestions = [
  QuizQuestion(
    id: 'q1',
    question: 'Karnıyarık yapmak için hangi malzeme gerekli değildir?',
    options: ['Patlıcan', 'Kıyma', 'Makarna', 'Domates'],
    correctOptionIndex: 2,
    explanation: 'Karnıyarık yapımında makarna kullanılmaz.',
    type: QuestionType.ingredientSelection,
    relatedRecipe: turkishRecipes['karniyarik'],
  ),
  QuizQuestion(
    id: 'q2',
    question: 'Bu malzemelerle hangi yemek yapılabilir?',
    options: ['Karnıyarık', 'Mercimek Çorbası', 'Mantarlı Makarna', 'Ramen'],
    correctOptionIndex: 0,
    explanation: 'Verilen malzemelerle karnıyarık yapılabilir.',
    type: QuestionType.recipeGuessing,
    givenIngredients: [
      ingredients['patlican']!,
      ingredients['kıyma']!,
      ingredients['domates']!,
    ],
  ),
]; 