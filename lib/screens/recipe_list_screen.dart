import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import 'add_recipe_screen.dart';
import '../widgets/recipe_tile.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  String searchQuery = '';
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final filteredRecipes = recipes.where((recipe) {
      final matchesQuery = recipe.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          recipe.ingredients.toLowerCase().contains(searchQuery.toLowerCase());

      final matchesCategory = selectedCategory == null || recipe.category == selectedCategory;

      return matchesQuery && matchesCategory;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddRecipeScreen()),
              );
              setState(() {});
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(96),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search recipes...',
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) => setState(() => searchQuery = value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: DropdownButton<String>(
                  hint: Text("Filter by Category"),
                  value: selectedCategory,
                  items: ['Breakfast', 'Lunch', 'Dinner', 'Dessert']
                      .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                      .toList()
                    ..insert(0, DropdownMenuItem(value: null, child: Text("All"))),
                  onChanged: (value) => setState(() => selectedCategory = value),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredRecipes.length,
        itemBuilder: (context, index) => RecipeTile(recipe: filteredRecipes[index]),
      ),
    );
  }
}
