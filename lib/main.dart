import 'package:first_app/ui/navigation/navigation_test.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  if (kDebugMode) {
    WidgetsApp.debugAllowBannerOverride = false;
    WidgetInspectorService.instance.selection.clear();
    WidgetInspectorService.instance.selectionChangedCallback = () {};
  }
  runApp(const ProviderScope(child: MyApp()));
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
      home: NavigationTest(),
    );
  }
}
