import 'package:flutter/material.dart';

class ImageDisplayer extends StatelessWidget {
  const ImageDisplayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: AspectRatio(
                    aspectRatio: 2 / 1,
                    child: Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Container(
                height: 200,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  // ⚠️ Important: Do not use both `color` in Container and inside BoxDecoration — choose one!
                  color: const Color(0xff7c94b6),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                  border: Border(
                    bottom: BorderSide(
                      color: Color(Colors.red.toARGB32()),
                      width: 7.0,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                color: Colors.amber[600],
                width: 48.0,
                height: 48.0,
              ),
              Card(
                color: Colors.blue,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      'Hello World',
                      maxLines: 2,
                      overflow: TextOverflow.visible,
                      softWrap: true,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(30),
                child: Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
