import 'package:flutter/material.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem(this.assetName, this.title, {super.key});

  /// image name without extension
  final String assetName;

  /// e.g., "Coffee", "Burger"
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 2 / 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/$assetName.jpg', fit: BoxFit.cover),
            ),
          ),
          Text('Made $title', style: TextStyle(fontSize: 20)),
          Text(
            // You can embed variables in a string using $variableName
            "Have you ever made your own $title? Once you've tried a homemade "
            "$title, you'll never go back.",
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
