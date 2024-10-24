import 'package:flutter/material.dart';
import 'package:sw/wordManaement/listOfWords.dart';
import 'package:provider/provider.dart';

class Webkeys1 extends StatefulWidget {
  final String child;
  Webkeys1({required this.child});

  @override
  State<Webkeys1> createState() => _KeysState();
}

class _KeysState extends State<Webkeys1> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Listofwords>(
      builder: (context, listOfWords_, child) => InkWell(
        onTap: () {
          listOfWords_.addWordsandLetters(context, widget.child);
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Calculate dynamic font size based on container size
            double fontSize = constraints.maxWidth * 0.6; // Example: 20% of the container width
            return Container(
                child: Center(
                  child: Text(
                    widget.child,
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
            );
          },
        ),
      ),
    );
  }
}
