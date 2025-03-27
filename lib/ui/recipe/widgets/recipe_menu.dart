import 'package:flutter/material.dart';

class RecipeMenu extends StatelessWidget {
  const RecipeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          MenuItem(Icons.food_bank, 'ALL'),
          SizedBox(width: 25),
          MenuItem(Icons.coffee, 'Coffee'),
          SizedBox(width: 25),
          MenuItem(Icons.fastfood, 'Burger'),
          SizedBox(width: 25),
          MenuItem(Icons.local_pizza, 'Pizza'),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const MenuItem(this.icon, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
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
          Icon(icon, color: Colors.redAccent, size: 30),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
