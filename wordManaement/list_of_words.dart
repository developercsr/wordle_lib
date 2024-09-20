import 'package:flutter/material.dart';

class wordsTried extends StatelessWidget {
  const wordsTried({super.key});
  int length=3;
  int tries=6;
  @override
  Widget build(BuildContext context) {
    List<List<String>> listOfWords=List<List<String>>.generate(length, List<String>.generate(length,""));
    return listOfWords;
  }
}