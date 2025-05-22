import 'package:flutter/material.dart';
import '../models/recipe.dart';
//import '../data/dummy_data.dart';

class AddRecipeScreen extends StatefulWidget {
  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final nameController = TextEditingController();
  final ingredientsController = TextEditingController();
  final instructionsController = TextEditingController();
  String? selectedCategory;

  void addRecipe() {
    if (selectedCategory == null || nameController.text.isEmpty) return;

    recipes.add(Recipe(
      name: nameController.text,
      imagePath: 'assets/pancake.jpg', // Placeholder for simplicity
      ingredients: ingredientsController.text,
      instructions: instructionsController.text,
      category: selectedCategory!,
    ));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Recipe')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: 'Recipe Name')),
            TextField(controller: ingredientsController, decoration: InputDecoration(labelText: 'Ingredients')),
            TextField(controller: instructionsController, decoration: InputDecoration(labelText: 'Instructions')),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Category'),
              value: selectedCategory,
              items: ['Breakfast', 'Lunch', 'Dinner', 'Dessert']
                  .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                  .toList(),
              onChanged: (value) => setState(() => selectedCategory = value),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: addRecipe, child: Text('Submit Recipe')),
          ],
        ),
      ),
    );
  }
}
