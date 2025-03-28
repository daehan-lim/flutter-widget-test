import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const message = 'This very long button here so you know';

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
                onPressed: () => showDialog(context),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(message),
              ),

              Container(
                constraints: BoxConstraints(minWidth: 200, minHeight: 56),
                child: IntrinsicWidth(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    child: Text(
                      message,
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      softWrap: false,
                    ),
                  ),
                ),
              ),

              // More common but can break into 2 lines if localization text bigger
              SizedBox(
                width: 200,
                height: 56,
                child: ElevatedButton(onPressed: () {}, child: Text(message)),
              ),

              //Rarely used
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.24,
                height: MediaQuery.of(context).size.width * 0.14,
                child: ElevatedButton(onPressed: () {}, child: Text(message)),
              ),

              ElevatedButton(onPressed: () {}, child: Text(message)),
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
              TextButton(onPressed: () {}, child: Text(message)),
              OutlinedButton(onPressed: () {}, child: Text(message)),
              OutlinedButton(
                onPressed: () {},
                child: Icon(Icons.ac_unit_outlined),
              ),
              CupertinoButton(onPressed: () {}, child: Text(message)),
            ],
          ),
        ),
      ),
    );
  }

  void showDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder:
          (context) => CupertinoAlertDialog(
            title: Text('Confirm exit'),
            content: Text('Are you sure you wish to exit?'),
            actions: [
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
    );
  }
}
