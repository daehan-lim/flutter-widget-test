import 'package:flutter/material.dart';

class TestAspectRatio extends StatelessWidget {
  const TestAspectRatio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.asset('assets/coffee.jpg', fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
