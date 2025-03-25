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
              children: [
                TabText("Woman"),
                Spacer(),
                TabText("Kids"),
                Spacer(flex: 1),
                TabText("Shoes"),
                Spacer(),
                TabText("Bag"),
              ],
            ),
          ),
          SizedBox(height: 300, width: 80, child: Image.asset("assets/bag.jpg", fit: BoxFit.contain)),
          Flexible(child: Image.asset("assets/shoes.jpg", fit: BoxFit.cover)),
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