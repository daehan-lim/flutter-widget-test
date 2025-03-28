import 'package:flutter/material.dart';

class SeatSelectBox extends StatelessWidget {
  final int? selectedRow;
  final int? selectedCol;
  final void Function(int rowNum, int colNum) onSelected;

  const SeatSelectBox(
    this.selectedRow,
    this.selectedCol,
    this.onSelected, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Screen',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          for (int i = 1; i <= 5; i++) ...[
            const SizedBox(height: 10),
            SeatRow(i, selectedRow, selectedCol, onSelected),
          ],
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SeatInfo('Available', Colors.grey),
              SizedBox(width: 4),
              const SeatInfo('Selected', Colors.amber),
            ],
          ),
        ],
      ),
    );
  }
}

class SeatRow extends StatelessWidget {
  final int rowNum;
  final int? selectedRow;
  final int? selectedCol;
  final void Function(int rowNum, int colNum) onSelected;

  const SeatRow(
    this.rowNum,
    this.selectedRow,
    this.selectedCol,
    this.onSelected, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Text(
                '$rowNum',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          for (var i = 1; i <= 10; i++)
            Seat(rowNum, i, selectedRow, selectedCol, onSelected),
        ],
      ),
    );
  }
}

class Seat extends StatelessWidget {
  final int rowNum;
  final int colNum;
  final int? selectedRow;
  final int? selectedCol;
  final void Function(int rowNum, int colNum) onSelected;

  const Seat(
    this.rowNum,
    this.colNum,
    this.selectedRow,
    this.selectedCol,
    this.onSelected, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2),
        child: AspectRatio(
          aspectRatio: 1,
          child: GestureDetector(
            onTap: () {
              onSelected(rowNum, colNum);
            },
            child: Container(
              decoration: BoxDecoration(
                color:
                    selectedRow == rowNum && selectedCol == colNum
                        ? Colors.amber
                        : Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SeatInfo extends StatelessWidget {
  final String text;
  final Color color;

  const SeatInfo(this.text, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: TextStyle(fontSize: 14)),
        const SizedBox(width: 4),
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}
