import 'package:first_app/ui/seat/widgets/seat_bottom.dart';
import 'package:first_app/ui/seat/widgets/seat_select_box.dart';
import 'package:first_app/utils/util.dart';
import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {

  const SeatPage({super.key});

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  int? selectedRow;

  int? selectedCol;

  void onSelected(int rowNum, int colNum) {
    if(selectedRow == rowNum && selectedCol == colNum) {
      setState(() {
        selectedRow = null;
        selectedCol = null;
      });
    } else {
      setState(() {
        selectedRow = rowNum;
        selectedCol = colNum;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text('Seats'), centerTitle: true),
      body: Column(
        children: [
          // Expanded(child: Container(color: hexColor('#EFEFEF'))),
          SeatSelectBox(selectedRow, selectedCol, onSelected),
          SeatBottom(selectedRow, selectedCol),
        ],
      ),
    );
  }
}
