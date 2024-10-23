import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sw/Components/profileIcon.dart';
import 'lengthSet.dart';
import 'package:sw/Components/hintIcons.dart';
import 'package:sw/Components/resetmidddleOfGame.dart';
import 'package:sw/Components/report.dart';
class AppBar1 extends StatefulWidget implements PreferredSizeWidget
{
  const AppBar1({super.key});
  @override
  State<AppBar1> createState() => _AppBar1State();
  @override
  Size get preferredSize =>const Size.fromHeight(59.0);
}

class _AppBar1State extends State<AppBar1>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.1,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
            )
          ),
          backgroundColor:const Color.fromARGB(255, 253, 161, 25),
          centerTitle: false,
          title:Text("शब्दजाल",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
          actions: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Word Length : "),
                  lengthOfWordSetState(),
                  SizedBox(width: 50,),
                  // TextButton(onPressed: restartInmiddle(context), child: Text("RESET")),
                  IconButton(onPressed: (){restartInmiddle(context);}, icon: Icon(Icons.restart_alt),tooltip: "Reset the Game",),
                  SizedBox(width: 50,),
                  hintBox(),
                  SizedBox(width: 50,),
                  profileIcon(),
                  SizedBox(width: 50,),
                  IconButton(onPressed:(){reporting();}, icon: Icon(Icons.report)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}