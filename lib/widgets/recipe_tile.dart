import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeTile extends StatelessWidget {
  final Recipe recipe;

  const RecipeTile({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Image.asset(recipe.imagePath, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(recipe.name, overflow: TextOverflow.ellipsis),
        subtitle: Text(
          '${recipe.category} • ${recipe.ingredients}',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
