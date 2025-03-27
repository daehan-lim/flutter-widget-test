import 'package:flutter/material.dart';

class TestListViewBuilder extends StatelessWidget {
  TestListViewBuilder({super.key});

  final entries = ['A', 'B', 'C'];
  final colorCodes = [600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber[colorCodes[index % colorCodes.length]],
              child: Center(child: Text('Entry ${entries[index % entries.length]}')),
            );
          },
        ),
      ),
    );
  }
}
