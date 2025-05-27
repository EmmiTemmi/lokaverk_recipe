import 'package:flutter/material.dart';
import 'dart:io';
import '../models/recipe.dart';

class RecipeTile extends StatelessWidget {
  final Recipe recipe;

  const RecipeTile({required this.recipe});

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (recipe.image != null) {
      imageWidget = Image.file(recipe.image!, width: 50, height: 50, fit: BoxFit.cover);
    } else if (recipe.imageUrl != null) {
      imageWidget = Image.network(recipe.imageUrl!, width: 50, height: 50, fit: BoxFit.cover);
    } else if (recipe.imagePath != null) {
      imageWidget = Image.asset(recipe.imagePath!, width: 50, height: 50, fit: BoxFit.cover);
    } else {
      imageWidget = Icon(Icons.image_not_supported, size: 50);
    }

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: imageWidget,
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
