import 'package:flutter/material.dart';

class TestStack extends StatelessWidget {
  const TestStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                ), // base layer
                const Positioned(
                  bottom: 16,
                  right: 16,
                  child: Text(
                    'Overlay',
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.pinkAccent,
                      child: Icon(Icons.edit, size: 18),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    color: Colors.red,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                  )
                ],
              ),
            ),

            SizedBox(height: 10),
            Center(
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: 150,
                      height: 150,
                      color: Colors.red,
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 5,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.green,
                    ),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 5,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
