import 'package:flutter/material.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabText("Woman"),
                // Spacer(),
                TabText("Kids"),
                // Spacer(flex: 1),
                TabText("Shoes"),
                // Spacer(),
                TabText("Bag"),
              ],
            ),
          ),
          Expanded(child: Image.asset("assets/bag.jpg", fit: BoxFit.cover)),
          SizedBox(height: 2),
          Expanded(child: Image.asset("assets/shoes.jpg", fit: BoxFit.cover)),
        ],
      ),
    )); // <- base UI
  }
}

class TabText extends StatelessWidget {
  final String text;

  const TabText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(fontWeight: FontWeight.bold));
  }
}