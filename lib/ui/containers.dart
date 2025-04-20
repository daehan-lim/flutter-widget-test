import 'package:flutter/material.dart';

class Containers extends StatelessWidget {
  const Containers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                ),
              ),
              Container(
                height: 60,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border(top: BorderSide(width: 4)),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.symmetric(vertical: BorderSide(width: 6)),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
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
                      color: Colors.red,
                      width: 7.0,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
