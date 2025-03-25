import 'package:flutter/material.dart';

class ImageDisplayer extends StatelessWidget {
  const ImageDisplayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
          ),
        ),
      ),
    );
  }
}
