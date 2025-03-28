import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestButtons extends StatelessWidget {
  const TestButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.heart_broken),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {},
                child: Icon(Icons.ac_unit_outlined),
              ),
              ElevatedButton(onPressed: () {}, child: Text('Hello')),
              TextButton(onPressed: () {}, child: Text('Hello')),
              OutlinedButton(onPressed: (){}, child: Text('Hello')),
              OutlinedButton(onPressed: (){}, child: Icon(Icons.ac_unit_outlined),),
              CupertinoButton(onPressed: () {}, child: Text('Hello')),
            ],
          ),
        ),
      ),
    );
  }
}
