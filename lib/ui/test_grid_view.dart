import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_app/utils/app_cached_image.dart';
import 'package:flutter/material.dart';

class TestGridView extends StatelessWidget {
  const TestGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                return AppCachedImage(
                  imageUrl: 'https://picsum.photos/seed/$index/300/300',
                );
              },
            ),
          ),

          SizedBox(height: 20),

          Flexible(
            child: GridView.builder(
              padding: EdgeInsets.all(20),
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 170,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return AppCachedImage(
                  imageUrl: 'https://picsum.photos/seed/$index/300/300',
                  fit: BoxFit.cover,
                );
              },
            ),
          ),

          SizedBox(height: 20),

          Flexible(
            child: GridView(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              children: [
                AppCachedImage(imageUrl: 'https://picsum.photos/300/300'),
                AppCachedImage(imageUrl: 'https://picsum.photos/300/300'),
                AppCachedImage(imageUrl: 'https://picsum.photos/300/300'),
                AppCachedImage(imageUrl: 'https://picsum.photos/300/300'),
                AppCachedImage(imageUrl: 'https://picsum.photos/300/300'),
                AppCachedImage(imageUrl: 'https://picsum.photos/300/300'),
                AppCachedImage(imageUrl: 'https://picsum.photos/300/300'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
