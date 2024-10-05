import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sw/wordManaement/listOfWords.dart';
 restartInmiddle(BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Center(child: const Text('ALERT')),
      content: const Text('Are you sure you want to Restart the Game???'),
      actions: <Widget>[
        TextButton(
          onPressed: (){
            Provider.of<Listofwords>(context, listen: false).reserAll(context);
            Navigator.pop(context, 'Cancel');
            },
          child: const Text('YES'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'NO'),
          child: const Text('No'),
        ),
      ],
    ),
  );
}