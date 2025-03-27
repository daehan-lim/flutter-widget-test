import 'package:flutter/material.dart';

class RecipeTitle extends StatelessWidget {
  const RecipeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1),
      child: Text(
        "Recipes",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
      ),
    );
  }
}
