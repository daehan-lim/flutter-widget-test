import 'package:first_app/ui/navigation/test_second.dart';
import 'package:flutter/material.dart';

class TestFirst extends StatelessWidget {
  const TestFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First')),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TestSecond()),
                );
                if (result != null) {
                  print(result);
                } else {
                  print('empty');
                }
              },
              child: Text('First screen', style: TextStyle(fontSize: 50)),
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: CircularProgressIndicator(
                value: 0.9,
              ),
            )
          ],
        ),
      ),
    );
  }
}
