import 'package:flutter/material.dart';

class SeatSelectBox extends StatelessWidget {
  const SeatSelectBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Screen',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          for (int i = 1; i <= 5; i++) ...[
            SizedBox(height: 10),
            SeatRow(i),
          ],
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SeatInfo('Available', Colors.grey),
              SizedBox(width: 4),
              SeatInfo('Selected', Colors.amber),
            ],
          ),
        ],
      ),
    );
  }
}

class SeatRow extends StatelessWidget {
  final int rowNum;

  const SeatRow(this.rowNum, {super.key});

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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          for (var i = 0; i < 10; i++) Seat(),
        ],
      ),
    );
  }
}

class Seat extends StatelessWidget {
  const Seat({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2),
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
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
        SizedBox(width: 4),
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
