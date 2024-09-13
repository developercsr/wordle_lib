import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sw/wordManaement/listOfWords.dart';
import 'package:provider/provider.dart';
class lengthOfWordSetState extends StatefulWidget {
  const lengthOfWordSetState({super.key});
  @override 
  State<lengthOfWordSetState> createState() => _lengthOfWordSetStateState();
}
class _lengthOfWordSetStateState extends State<lengthOfWordSetState> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Listofwords>(
      builder: ((context,listOfWoreds_,child) =>
    Container(
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(10.0),
              border : Border.all(
                color: Color.fromARGB(255, 251, 255, 18),
              )
            ),
            child: DropdownButton<int>(
              value: listOfWoreds_.wordlength,
              onChanged: ((int? value)
              {
                listOfWoreds_.chagingwordlength(value??2);
              }),
              items:const [
                DropdownMenuItem<int>(
                    value: 3,
                    child: Text("3"),
                ),
                DropdownMenuItem<int>(
                    value: 4,
                    child: Text("4"),
                ),
                DropdownMenuItem<int>(
                    value: 5,
                    child: Text("5"),
                ),
              ],
            ),
          )
        ],
      ),
     )
    ),
  );
}
}