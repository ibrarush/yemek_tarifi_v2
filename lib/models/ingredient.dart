class Ingredient {
  final String id;
  final String name;
  final String image; // SVG path
  final String category; // sebze, et, baharat vs.

  const Ingredient({
    required this.id,
    required this.name,
    required this.image,
    required this.category,
  });
} 