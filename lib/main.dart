import 'package:flutter/material.dart';
import 'screens/recipe_list_screen.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Recipe App',
      theme: ThemeData(primarySwatch: Colors.red),
      home: RecipeListScreen(),
    );
  }
}