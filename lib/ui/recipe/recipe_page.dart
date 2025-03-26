import 'package:first_app/ui/recipe/widgets/recipe_list_item.dart';
import 'package:first_app/ui/recipe/widgets/recipe_menu.dart';
import 'package:first_app/ui/recipe/widgets/recipe_title.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the next page',
            onPressed: () {},
          ),
        ],
      )
      ,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecipeTitle(),
            RecipeMenu(),
            RecipeListItem(),
            RecipeListItem(),
            RecipeListItem(),
          ],
        ),
      ),
    );
  }
}
