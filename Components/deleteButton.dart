import 'package:flutter/material.dart';

class Deletebutton extends StatelessWidget {
  final VoidCallback keyBoardChange;
  Deletebutton({required this.keyBoardChange});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: keyBoardChange,  
      child: Icon(Icons.change_history_outlined),
    );
  }
}