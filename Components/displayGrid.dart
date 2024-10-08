import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sw/wordManaement/listOfWords.dart';
class displayGrid extends StatefulWidget {
  @override
  State<displayGrid> createState() => _displayGridState();
}
class _displayGridState extends State<displayGrid> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Listofwords>(
    builder: ((context,listofWords_,child)=> 
  GridView.count(
    crossAxisCount:listofWords_.wordlength,
    mainAxisSpacing: 5,
    crossAxisSpacing: 5,
    children:listofWords_.displayGridCells.expand((row) => row).toList(),
  )));
  }
  }