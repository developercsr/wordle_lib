import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sw/Components/hintDialogue.dart';

class hintBox extends StatefulWidget {
  const hintBox({super.key});

  @override
  State<hintBox> createState() => _hintBoxState();
}

class _hintBoxState extends State<hintBox> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){showMyDialogofHints(context);}, icon: Icon(Icons.lightbulb_circle_rounded),tooltip: "Hint of the word",);
  }
}