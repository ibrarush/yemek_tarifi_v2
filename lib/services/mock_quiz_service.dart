import '../models/quiz_question.dart';

class MockQuizService {
  static String _normalizeCountryId(String countryId) {
    final Map<String, String> countryMapping = {
      'turkiye': 'TR',
      'turkey': 'TR',
      'italya': 'IT',
      'italy': 'IT',
      'italia': 'IT',
      'japonya': 'JP',
      'japan': 'JP',
      'hindistan': 'IN',
      'india': 'IN',
    };
    
    final normalizedId = countryMapping[countryId.toLowerCase()] ?? countryId;
    print('DEBUG Service: Normalizing countryId: $countryId -> $normalizedId');
    return normalizedId;
  }

  static Map<String, Map<String, List<QuizQuestion>>> getQuestions() {
    return {
      'TR': { // Türkiye
        'Sebze Yemekleri': [
          QuizQuestion(
            id: 'tr_sebze_1',
            question: "Kartlarda bulunan sebzelerden hangisi yapılamaz?",
            options: ["Karnıyarık", "Patlıcan Musakka", "Etli Türlü", "Kızartma"],
            correctOptionIndex: 0,
            explanation: "Karnıyarık bu malzemelerle yapılamaz çünkü ek malzemelere ihtiyaç vardır.",
            type: QuestionType.recipeGuessing,
          ),
          QuizQuestion(
            id: 'tr_sebze_2',
            question: "Hangi sebze yemeği zeytinyağlı olarak yapılmaz?",
            options: ["Taze Fasulye", "İmambayıldı", "Türlü", "Kuru Fasulye"],
            correctOptionIndex: 3,
            explanation: "Kuru fasulye genellikle zeytinyağlı değil, sıvı yağ ile yapılır.",
            type: QuestionType.recipeGuessing,
          ),
          QuizQuestion(
            id: 'tr_sebze_3',
            question: "Patlıcan yemeklerinde morarmayı önlemek için ne yapılır?",
            options: ["Tuzlanır", "Yıkanır", "Soyulur", "Haşlanır"],
            correctOptionIndex: 0,
            explanation: "Patlıcanlar tuzlanarak acısı ve morarmayı önlenir.",
            type: QuestionType.cookingOrder,
          ),
        ],
        'Et Yemekleri': [
          QuizQuestion(
            id: 'tr_et_1',
            question: "Hangisi geleneksel bir Türk et yemeği değildir?",
            options: ["İskender", "Tandır", "Beef Wellington", "Kuzu Kapama"],
            correctOptionIndex: 2,
            explanation: "Beef Wellington İngiliz mutfağına ait bir yemektir.",
            type: QuestionType.recipeGuessing,
          ),
          QuizQuestion(
            id: 'tr_et_2',
            question: "Kuzu pirzola hangi bölgeden elde edilir?",
            options: ["Boyun", "Kaburga", "But", "Sırt"],
            correctOptionIndex: 1,
            explanation: "Pirzola, kuzunun kaburga bölgesinden elde edilir.",
            type: QuestionType.ingredientSelection,
          ),
          QuizQuestion(
            id: 'tr_et_3',
            question: "Hangisi köfte yapımında kullanılmaz?",
            options: ["Soğan", "Maydanoz", "Kimyon", "Zencefil"],
            correctOptionIndex: 3,
            explanation: "Zencefil geleneksel Türk köftesinde kullanılmaz.",
            type: QuestionType.ingredientSelection,
          ),
        ],
        'Sıcak İçecekler': [
          QuizQuestion(
            id: 'tr_kahve_1',
            question: "Türk kahvesi yapımında hangi pişirme yöntemi yanlıştır?",
            options: ["Köpürtme", "Kaynatma", "Karıştırma", "Demleme"],
            correctOptionIndex: 3,
            explanation: "Türk kahvesi demlenmez, kaynatılarak pişirilir.",
            type: QuestionType.cookingOrder,
          ),
          QuizQuestion(
            id: 'tr_kahve_2',
            question: "Geleneksel Türk çayı nasıl demlenir?",
            options: ["Poşet ile", "Çaydanlıkta", "French Press ile", "Termosta"],
            correctOptionIndex: 1,
            explanation: "Türk çayı geleneksel olarak çift katlı çaydanlıkta demlenir.",
            type: QuestionType.cookingOrder,
          ),
          QuizQuestion(
            id: 'tr_kahve_3',
            question: "Salep hangi bitkiden elde edilir?",
            options: ["Orkide", "Zencefil", "Tarçın", "Ihlamur"],
            correctOptionIndex: 0,
            explanation: "Salep, orkide yumrularından elde edilir.",
            type: QuestionType.ingredientSelection,
          ),
        ],
        'Tatlılar': [
          QuizQuestion(
            id: 'tr_tatli_1',
            question: "Hangi tatlı şerbetsiz yapılır?",
            options: ["Baklava", "Kazandibi", "Tulumba", "Şekerpare"],
            correctOptionIndex: 1,
            explanation: "Kazandibi sütlü bir tatlıdır ve şerbet kullanılmaz.",
            type: QuestionType.recipeGuessing,
          ),
          QuizQuestion(
            id: 'tr_tatli_2',
            question: "Kemalpaşa tatlısı hangi peynirle yapılır?",
            options: ["Lor", "Kaşar", "Beyaz Peynir", "Tulum"],
            correctOptionIndex: 0,
            explanation: "Kemalpaşa tatlısı lor peyniri ile yapılır.",
            type: QuestionType.ingredientSelection,
          ),
          QuizQuestion(
            id: 'tr_tatli_3',
            question: "Aşure'de hangi malzeme bulunmaz?",
            options: ["Buğday", "Nohut", "Kuru Fasulye", "Krema"],
            correctOptionIndex: 3,
            explanation: "Aşure'de krema kullanılmaz.",
            type: QuestionType.ingredientSelection,
          ),
        ],
        'Çorba': [
          QuizQuestion(
            id: 'tr_corba_1',
            question: "Hangisi geleneksel bir Türk çorbası değildir?",
            options: ["Mercimek", "Tarhana", "Minestrone", "İşkembe"],
            correctOptionIndex: 2,
            explanation: "Minestrone İtalyan mutfağına ait bir çorbadır.",
            type: QuestionType.recipeGuessing,
          ),
          QuizQuestion(
            id: 'tr_corba_2',
            question: "Yayla çorbası hangi malzeme ile yapılır?",
            options: ["Yoğurt", "Domates", "Mercimek", "Kemik Suyu"],
            correctOptionIndex: 0,
            explanation: "Yayla çorbası yoğurt bazlı bir çorbadır.",
            type: QuestionType.ingredientSelection,
          ),
          QuizQuestion(
            id: 'tr_corba_3',
            question: "Tarhana çorbasının ana malzemesi nedir?",
            options: ["Kurutulmuş Yoğurt", "Mercimek", "Bulgur", "Un"],
            correctOptionIndex: 0,
            explanation: "Tarhana, yoğurt ve un karışımının fermente edilip kurutulmasıyla yapılır.",
            type: QuestionType.ingredientSelection,
          ),
        ],
      },
      'IT': { // İtalya
        'Sebze Yemekleri': [
          QuizQuestion(
            id: 'it_sebze_1',
            question: "Hangi sebze Caponata'nın ana malzemesidir?",
            options: ["Patlıcan", "Domates", "Kabak", "Havuç"],
            correctOptionIndex: 0,
            explanation: "Caponata, patlıcan bazlı Sicilya yemeğidir.",
            type: QuestionType.ingredientSelection,
          ),
          QuizQuestion(
            id: 'it_sebze_2',
            question: "Ratatouille hangi mutfağa aittir?",
            options: ["İtalyan", "Fransız", "İspanyol", "Yunan"],
            correctOptionIndex: 1,
            explanation: "Ratatouille Fransız mutfağına ait bir sebze yemeğidir.",
            type: QuestionType.countryGuessing,
          ),
          QuizQuestion(
            id: 'it_sebze_3',
            question: "Parmigiana hangi sebze ile yapılır?",
            options: ["Patlıcan", "Kabak", "Patates", "Domates"],
            correctOptionIndex: 0,
            explanation: "Parmigiana, patlıcan ve peynir katmanlarıyla yapılan geleneksel bir İtalyan yemeğidir.",
            type: QuestionType.ingredientSelection,
          ),
        ],
        'Et Yemekleri': [
          QuizQuestion(
            id: 'it_et_1',
            question: "Osso Buco hangi et ile yapılır?",
            options: ["Dana İncik", "Kuzu Pirzola", "Tavuk Göğsü", "Domuz Eti"],
            correctOptionIndex: 0,
            explanation: "Osso Buco, dana incik eti ile yapılan Milano'ya özgü bir yemektir.",
            type: QuestionType.ingredientSelection,
          ),
          QuizQuestion(
            id: 'it_et_2',
            question: "Saltimbocca hangi et ile yapılır?",
            options: ["Dana Eti", "Tavuk", "Kuzu", "Domuz"],
            correctOptionIndex: 0,
            explanation: "Saltimbocca, dana eti ve adaçayı yapraklarıyla yapılan Roma'ya özgü bir yemektir.",
            type: QuestionType.ingredientSelection,
          ),
        ],
        'Tatlılar': [
          QuizQuestion(
            id: 'it_tatli_1',
            question: "Tiramisu'nun ana malzemesi nedir?",
            options: ["Mascarpone Peyniri", "Ricotta Peyniri", "Krema", "Yoğurt"],
            correctOptionIndex: 0,
            explanation: "Tiramisu'nun ana malzemesi mascarpone peyniridir.",
            type: QuestionType.ingredientSelection,
          ),
          QuizQuestion(
            id: 'it_tatli_2',
            question: "Panna Cotta hangi malzeme ile yapılmaz?",
            options: ["Krema", "Jelatin", "Çikolata", "Vanilya"],
            correctOptionIndex: 2,
            explanation: "Panna Cotta'nın temel malzemeleri krema, şeker, jelatin ve vanilyadır.",
            type: QuestionType.ingredientSelection,
          ),
        ],
      },
      'JP': { // Japonya
        'Sebze Yemekleri': [
          QuizQuestion(
            id: 'jp_sebze_1',
            question: "Tempura hangi malzemelerle yapılır?",
            options: ["Sebze ve Deniz Ürünleri", "Sadece Sebzeler", "Sadece Deniz Ürünleri", "Sadece Et"],
            correctOptionIndex: 0,
            explanation: "Tempura, sebze ve deniz ürünlerinin özel bir hamurla kızartılmasıyla yapılır.",
            type: QuestionType.ingredientSelection,
          ),
          QuizQuestion(
            id: 'jp_sebze_2',
            question: "Miso çorbasının ana malzemesi nedir?",
            options: ["Miso Pasta", "Soya Sosu", "Balık Sosu", "Sos"],
            correctOptionIndex: 0,
            explanation: "Miso çorbası, fermente edilmiş soya fasulyesi pastası olan miso ile yapılır.",
            type: QuestionType.ingredientSelection,
          ),
        ],
        'Et Yemekleri': [
          QuizQuestion(
            id: 'jp_et_1',
            question: "Sukiyaki hangi et ile yapılır?",
            options: ["İnce Dilimlenmiş Sığır Eti", "Tavuk", "Domuz Eti", "Kuzu"],
            correctOptionIndex: 0,
            explanation: "Sukiyaki, ince dilimlenmiş sığır eti ve sebzelerle yapılan geleneksel bir Japon yemeğidir.",
            type: QuestionType.ingredientSelection,
          ),
          QuizQuestion(
            id: 'jp_et_2',
            question: "Yakitori hangi et ile yapılır?",
            options: ["Tavuk", "Sığır Eti", "Domuz Eti", "Kuzu"],
            correctOptionIndex: 0,
            explanation: "Yakitori, ızgarada pişirilen tavuk şişleridir.",
            type: QuestionType.ingredientSelection,
          ),
        ],
        'Tatlılar': [
          QuizQuestion(
            id: 'jp_tatli_1',
            question: "Mochi'nin ana malzemesi nedir?",
            options: ["Pirinç Unu", "Buğday Unu", "Mısır Unu", "Patates Nişastası"],
            correctOptionIndex: 0,
            explanation: "Mochi, özel bir pirinç unu olan mochiko ile yapılır.",
            type: QuestionType.ingredientSelection,
          ),
          QuizQuestion(
            id: 'jp_tatli_2',
            question: "Dango hangi malzeme ile yapılmaz?",
            options: ["Pirinç Unu", "Şeker", "Su", "Yumurta"],
            correctOptionIndex: 3,
            explanation: "Dango, pirinç unu, şeker ve su ile yapılan bir Japon tatlısıdır.",
            type: QuestionType.ingredientSelection,
          ),
        ],
      },
      'IN': { // Hindistan
        'Sebze Yemekleri': [
          QuizQuestion(
            id: 'in_sebze_1',
            question: "Palak Paneer'in ana malzemesi nedir?",
            options: ["Ispanak ve Peynir", "Patlıcan", "Karnabahar", "Mercimek"],
            correctOptionIndex: 0,
            explanation: "Palak Paneer, ıspanak ve paneer peyniri ile yapılan bir yemektir.",
            type: QuestionType.ingredientSelection,
          ),
          QuizQuestion(
            id: 'in_sebze_2',
            question: "Aloo Gobi hangi sebzelerle yapılır?",
            options: ["Patates ve Karnabahar", "Patlıcan ve Domates", "Kabak ve Havuç", "Ispanak ve Peynir"],
            correctOptionIndex: 0,
            explanation: "Aloo Gobi, patates ve karnabahar ile yapılan geleneksel bir Hint yemeğidir.",
            type: QuestionType.ingredientSelection,
          ),
        ],
        'Et Yemekleri': [
          QuizQuestion(
            id: 'in_et_1',
            question: "Butter Chicken hangi et ile yapılır?",
            options: ["Tavuk", "Kuzu", "Keçi", "Sığır"],
            correctOptionIndex: 0,
            explanation: "Butter Chicken, tandırda pişirilmiş tavuk ve domates sosu ile yapılan bir yemektir.",
            type: QuestionType.ingredientSelection,
          ),
          QuizQuestion(
            id: 'in_et_2',
            question: "Rogan Josh hangi et ile yapılır?",
            options: ["Kuzu", "Tavuk", "Keçi", "Sığır"],
            correctOptionIndex: 0,
            explanation: "Rogan Josh, kuzu eti ile yapılan baharatlı bir Hint yemeğidir.",
            type: QuestionType.ingredientSelection,
          ),
        ],
        'Tatlılar': [
          QuizQuestion(
            id: 'in_tatli_1',
            question: "Gulab Jamun hangi malzeme ile yapılır?",
            options: ["Süt Tozu", "Un", "Pirinç Unu", "Mısır Unu"],
            correctOptionIndex: 0,
            explanation: "Gulab Jamun, süt tozu ve un ile yapılan şerbetli bir Hint tatlısıdır.",
            type: QuestionType.ingredientSelection,
          ),
          QuizQuestion(
            id: 'in_tatli_2',
            question: "Kheer hangi malzeme ile yapılmaz?",
            options: ["Pirinç", "Süt", "Şeker", "Kakao"],
            correctOptionIndex: 3,
            explanation: "Kheer, pirinç, süt ve şeker ile yapılan geleneksel bir Hint tatlısıdır.",
            type: QuestionType.ingredientSelection,
          ),
        ],
      },
      // Diğer ülkeler...
    };
  }

  static List<QuizQuestion> getQuestionsForCountryAndCategory(String countryId, String category) {
    final normalizedCountryId = _normalizeCountryId(countryId);
    final allQuestions = getQuestions();
    print('DEBUG Service: Original CountryId: $countryId, Normalized: $normalizedCountryId, Category: $category');
    print('DEBUG Service: Available countries: ${allQuestions.keys.toList()}');
    print('DEBUG Service: Available categories for $normalizedCountryId: ${allQuestions[normalizedCountryId]?.keys.toList()}');
    return allQuestions[normalizedCountryId]?[category] ?? [];
  }
} 