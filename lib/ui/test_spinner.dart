import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestSpinner extends StatefulWidget {
  const TestSpinner({super.key});

  @override
  State<TestSpinner> createState() => _TestSpinnerState();
}

class _TestSpinnerState extends State<TestSpinner> {
  final List<String> options = ['Apple', 'Banana', 'Cherry', 'Mango'];
  int selectedIndex = 0;

  void _showPicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 250,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: CupertinoPicker(
                scrollController:
                FixedExtentScrollController(initialItem: selectedIndex),
                itemExtent: 40,
                onSelectedItemChanged: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                children: options
                    .map((item) => Center(child: Text(item)))
                    .toList(),
              ),
            ),
            CupertinoButton(
              child: const Text('확인'), // Korean for Confirm
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('iOS Spinner Example')),
      body: Center(
        child: GestureDetector(
          onTap: () => _showPicker(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(options[selectedIndex]),
                const Icon(CupertinoIcons.chevron_down),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
