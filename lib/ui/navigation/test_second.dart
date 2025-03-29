import 'package:flutter/material.dart';

class TestSecond extends StatelessWidget {
  const TestSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (!didPop) {
          Navigator.of(context).pop(result ?? 'Nope.');
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Second')),
        body: Center(
          child: Column(
            children: [
              GestureDetector(
                // onTap: () => Navigator.push(context, TestSecond()),
                child: Text('Second screen', style: TextStyle(fontSize: 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
