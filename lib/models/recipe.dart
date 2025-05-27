import 'dart:io';

class Recipe {
  final String name;
  final String ingredients;
  final String instructions;
  final String category;
  final File? image;
  final String? imagePath;
  final String? imageUrl;

  Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.category,
    this.image,
    this.imagePath,
    this.imageUrl,
  });
}
