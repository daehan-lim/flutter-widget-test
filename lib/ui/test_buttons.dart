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

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 90, vertical: 18),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text('Hello'),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.height * 0.24,
                height: MediaQuery.of(context).size.width * 0.14,
                child: ElevatedButton(onPressed: () {}, child: Text('Hello')),
              ),

              SizedBox(
                width: 200,
                height: 56,
                child: ElevatedButton(onPressed: () {}, child: Text('Hello')),
              ),

              ElevatedButton(onPressed: () {}, child: Text('Hello')),
              IconButton(onPressed: () {}, icon: Icon(Icons.heart_broken)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {},
                child: Icon(Icons.ac_unit_outlined),
              ),
              TextButton(onPressed: () {}, child: Text('Hello')),
              OutlinedButton(onPressed: () {}, child: Text('Hello')),
              OutlinedButton(
                onPressed: () {},
                child: Icon(Icons.ac_unit_outlined),
              ),
              CupertinoButton(onPressed: () {}, child: Text('Hello')),
            ],
          ),
        ),
      ),
    );
  }
}
