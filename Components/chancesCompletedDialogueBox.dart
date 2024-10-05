import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sw/wordManaement/listOfWords.dart';
chancesCompleted(BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Center(child: const Text('ALERT')),
      content: const Text('YourChances are completed For this session\n You want to Restart it again ???'),
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