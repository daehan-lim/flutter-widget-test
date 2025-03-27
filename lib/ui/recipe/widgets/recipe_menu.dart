import 'package:flutter/material.dart';

class RecipeMenu extends StatelessWidget {
  const RecipeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        menuItem(),
      ],
    );
  }

  Container menuItem() {
    return Container(
        width: 60,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.food_bank, color: Colors.redAccent, size: 30),
            SizedBox(height: 5),
            Text(
              'ALL', // 영어 UI
              style: TextStyle(color: Colors.black87),
            ),
          ],
        ),
      );
  }
}
