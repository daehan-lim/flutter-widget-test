import 'package:flutter/material.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/coffee.jpg'),
          Text(
            'Made Coffee',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Have you ever made your own Coffee? Once you've tried a homemade Coffee, you'll never go back.",
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
