import 'package:flutter/material.dart';

class AnimatedContainerExmple extends StatefulWidget {
  const AnimatedContainerExmple({super.key});

  @override
  State<AnimatedContainerExmple> createState() =>
      _AnimatedContainerExmpleState();
}

class _AnimatedContainerExmpleState extends State<AnimatedContainerExmple> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Container(
          height: 300,
          color: Colors.blue,
          alignment: Alignment.center,
          child: AnimatedContainer(
            alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
            height: selected ? 200 : 100,
            width: selected ? 200 : 100,
            decoration: BoxDecoration(
              color: selected ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(selected ? 0 : 20),
            ),
            padding: EdgeInsets.all(selected ? 10 : 5),
            curve: Curves.easeIn,
            duration: Duration(seconds: 1),
            child: Container(width: 50, height: 50, color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
