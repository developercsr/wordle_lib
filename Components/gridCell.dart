import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class gridCell extends StatefulWidget {
  final String name;
  const gridCell({ required this.name});

  @override
  State<gridCell> createState() => _gridCellState();
}
class _gridCellState extends State<gridCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        color:Color.fromARGB(255, 242, 254, 255),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color.fromARGB(255, 70, 70, 70),
          width: 4,
        ),
      ),
      child: Center(child: Text(widget.name,style: TextStyle(color: Colors.deepOrangeAccent,
      fontSize: 22,
      fontWeight: FontWeight.bold),
            ),));
  }
}