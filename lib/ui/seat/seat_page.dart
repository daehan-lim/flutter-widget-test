import 'package:first_app/ui/seat/widgets/seat_bottom.dart';
import 'package:first_app/ui/seat/widgets/seat_select_box.dart';
import 'package:first_app/utils/util.dart';
import 'package:flutter/material.dart';

class SeatPage extends StatelessWidget {
  const SeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text('Seats'), centerTitle: true),
      body: Column(
        children: [
          // Expanded(child: Container(color: hexColor('#EFEFEF'))),
          SeatSelectBox(),
          SeatBottom(),
        ],
      ),
    );
  }
}
