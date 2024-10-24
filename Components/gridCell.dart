import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class gridCell extends StatefulWidget {
  final String name;
  final Color backGroundClour;
  const gridCell({ required this.name, this.backGroundClour=const Color.fromARGB(255, 242, 254, 255)});
  @override
  State<gridCell> createState() => _gridCellState();
}
class _gridCellState extends State<gridCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        color:widget.backGroundClour,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color.fromARGB(255, 70, 70, 70),
          width: 4, 
        ),
      ),
      child: LayoutBuilder(
          builder: (context, constraints) {
            double fontSize = constraints.maxWidth * 0.25;
            return Container(
                child: Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.name,
                      style: TextStyle(fontSize: fontSize,color: Colors.orange,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            );
          },
        ),
            );
  }
}