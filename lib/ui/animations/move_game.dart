import 'dart:math';

import 'package:flutter/material.dart';

extension RandomExtensions on Random {
  double nextDoubleInRange(double min, double max) {
    return min + nextDouble() * (max - min);
  }
}

class MoveGame extends StatefulWidget {
  @override
  _MoveGameState createState() => _MoveGameState();
}

class _MoveGameState extends State<MoveGame> {
  final Random _random = Random();
  Alignment _alignment = Alignment.center;

  void _moveIcon() {
    setState(() {
      _alignment = Alignment(
        _random.nextDoubleInRange(-1, 1), // -1 to 1
        _random.nextDoubleInRange(-1, 1), // -1 to 1
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mini Tap Game'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          AnimatedAlign(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            alignment: _alignment,
            child: GestureDetector(
              onTap: _moveIcon,
              child: Icon(
                Icons.sports_esports,
                size: 60,
                color: Colors.teal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}