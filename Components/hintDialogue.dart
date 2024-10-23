import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
Future<void> showMyDialogofHints(BuildContext context) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  int wordlength=pref.getInt("wordlength")??0;
  String wordnumKey="wordnum"+wordlength.toString();
  int wordnum=pref.getInt(wordnumKey)??0;
  String hint1 = "";
  print(wordnum);
  if (wordnum == 0) {
    hint1 = "Please try at least one word before we give the hint";
  } else {
    hint1 = "This is Hint1";
    pref.setBool("hint1used", true);
    pref.setInt("hint1atword", wordnum);
  }
  String _dialogText=hint1;
                  
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text('Hints !'),
            content: SingleChildScrollView(
              child:ListBody(
                    children: <Widget>[
                      Text(_dialogText),
                    ],
                  )
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Hint2'),
                onPressed: () async {
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  int hint1usedat = pref.getInt("hint1atword") ?? 0;
                  int wordlength=pref.getInt("wordlength")??0;
                  String wordnumKey="wordnum"+wordlength.toString();
                  int wordnum=pref.getInt(wordnumKey)??0;
                  String hint2 = "";
                  bool ishint1used = pref.getBool("hint1used") ?? false;
                  if (ishint1used && hint1usedat != wordnum) {
                    hint2 = "Only After Hint 1 and you should complete at least a word check to use hint2 ";
                  } else {
                    hint2 = "This is Hint2";
                  }
                  setState(() {
                    _dialogText = hint2;
                  });
                },
              ),
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    },
  );
}