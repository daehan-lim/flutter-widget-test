import 'package:flutter/material.dart';

// StatefulWidget class
// Defines what kind of State it uses via createState()
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// State class
// Manages and updates the state
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint('build 호출됨');
    return Scaffold(
      body: Center(
        child: Text(
          '$_counter',
          style: TextStyle(fontSize: 100),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('_incrementCounter 호출됨 $_counter');
          setState(() {
            _counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
