import 'package:first_app/ui/recipe/widgets/recipe_list_item.dart';
import 'package:first_app/ui/recipe/widgets/recipe_menu.dart';
import 'package:first_app/ui/recipe/widgets/recipe_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('AppBar Demo'),
        actions: [
          Icon(
            CupertinoIcons.search, // Using Cupertino icon (쿠퍼티노 아이콘 사용)
            color: Colors.black,
          ),
          SizedBox(width: 15),
          Icon(
            CupertinoIcons.heart,
            color: Colors.redAccent,
          ),
          SizedBox(width: 15),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              RecipeTitle(),
              RecipeMenu(),
              RecipeListItem('coffee', 'Coffee'),
              RecipeListItem('burger', 'Burger'),
              RecipeListItem('pizza', 'Pizza'),
            ],
          ),
        ),
      ),
    );
  }
}
