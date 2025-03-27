import 'package:first_app/test_aspect_ratio.dart';
import 'package:first_app/ui/containers.dart';
import 'package:first_app/ui/image_displayer.dart';
import 'package:first_app/ui/recipe/recipe_page.dart';
import 'package:first_app/ui/store_page.dart';
import 'package:first_app/ui/test_list_view.dart';
import 'package:first_app/ui/test_list_view_builder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First Flutter App',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        fontFamily: 'NotoSansKR'
      ),
      debugShowCheckedModeBanner: false,
      home: TestAspectRatio(),
    );
  }
}
