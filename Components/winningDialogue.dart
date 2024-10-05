import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sw/wordManaement/listOfWords.dart';
void winningDialogue(BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Center(child: const Text('CONGRATULATIONS')),
      content: const Text('YOU GOT THE WORD\nif u want play again click on RESET'),
      actions: <Widget>[
        TextButton(
          onPressed: (){
            Provider.of<Listofwords>(context, listen: false).reserAll(context);
            Navigator.pop(context, 'Cancel');
            },
          child: const Text('RESET'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}