import 'package:flutter/material.dart';
import 'package:sw/wordManaement/listOfWords.dart';
import 'package:provider/provider.dart';
class Keys extends StatefulWidget {
  final String child;
  final double widthOf;
  Keys({required this.child,required this.widthOf});

  @override
  State<Keys> createState() => _KeysState();
}

class _KeysState extends State<Keys> 
{
  @override
  Widget build(BuildContext context)
  {
    return Consumer<Listofwords>(
      builder: ((context,listOfWoreds_,child) =>InkWell(
        onTap:()
            {
              listOfWoreds_.addWordsandLetters(context,widget.child);
            },
          child: Container(
            width: (widget.widthOf*0.95),
            child: Center(child: Text(widget.child,style: TextStyle(fontSize: 18),)),
          ),
      )
      )
      );
  }
}