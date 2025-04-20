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
      builder:
          (_) => Container(
            height: 250,
            color: CupertinoColors.systemBackground.resolveFrom(context),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(
                      initialItem: selectedIndex,
                    ),
                    itemExtent: 40,
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    children:
                        options
                            .map((item) => Center(child: Text(item)))
                            .toList(),
                  ),
                ),
                CupertinoButton(
                  child: const Text('확인'), // Korean for Confirm
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('iOS Spinner Example')),
      body: Column(
        children: [
          SizedBox(height: 20),
          PopupMenuButton<String>(
            position: PopupMenuPosition.under,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
            itemBuilder: (context) {
              return [
                // value에 터치했을 때 onSelect로 value 가 전달됨!
                PopupMenuItem<String>(value: '디지털가전', child: Text('디지털가전')),
                PopupMenuItem<String>(value: '디지털가전', child: Text('디지털가전')),
              ];
            },
            onSelected: (value) {
              print(value);
            },
            // 팝업 뜨기전 표시할 위젯
            child: Text('카테고리 선택'),
          ),
          SizedBox(height: 20),
          GestureDetector(
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
        ],
      ),
    );
  }
}
