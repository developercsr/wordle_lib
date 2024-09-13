import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'keys.dart';
class keyBoard extends StatefulWidget {
  @override
  State<keyBoard> createState() => _keysBoardState();
}
class _keysBoardState extends State<keyBoard> {
  bool KeyBoard_main=true;
  final List<String> vowels=['अ', 'आ', 'इ', 'ई', 'उ', 'ऊ','ऋ','ए','ऐ','ओ','औ', 'अं', 'अः'];
  final List<String> consonants1=['क', 'ख', 'ग', 'घ', 'ङ','च', 'छ', 'ज', 'झ', 'ञ','ट', 'ठ', 'ड'];
  final List<String> consonants2=['ढ', 'ण','त', 'थ', 'द', 'ध', 'न','प', 'फ', 'ब', 'भ', 'म','य'];
  final List<String> consonants3=['र', 'ल', 'व', 'श', 'ष', 'स', 'ह','क्ष', 'त्र', 'ज्ञ'];
  final List<String> halfvowels=['ा', 'ि', 'ी', 'ु', 'ू', 'ृ', 'ॄ', 'े', 'ै', 'ो', 'ौ', 'ं','ः'];
  final List<String> halfConsonants1=['क्', 'ख्', 'ग्', 'घ्', 'ङ्','च्', 'छ्', 'ज्', 'झ्', 'ञ्','ट्', 'ठ्', 'ड्'];
  final List<String> halfConsonants2=['ढ्', 'ण्','त्', 'थ्', 'द्', 'ध्', 'न्','प्', 'फ्', 'ब्', 'भ्', 'म्','य्'];
  final List<String> halfConsonants3=['र्', 'ल्', 'व्', 'श्','ष्', 'स्', 'ह्','क्ष्', 'त्र्', 'ज्ञ्'];
  void keyBoardChange()
  {
    setState(() {
      KeyBoard_main=!KeyBoard_main;
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height*0.3;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        physics:const NeverScrollableScrollPhysics(),
        children: [
          if (KeyBoard_main)...[
          buildHorizontalList(vowels, screenHeight, screenWidth),
          buildHorizontalList(consonants1, screenHeight, screenWidth),
          buildHorizontalList(consonants2, screenHeight, screenWidth),
          buildHorizontalList(consonants3, screenHeight, screenWidth)
        ]
        else...[
          buildHorizontalList(halfvowels, screenHeight, screenWidth),
          buildHorizontalList(halfConsonants1, screenHeight, screenWidth),
          buildHorizontalList(halfConsonants2, screenHeight, screenWidth),
          buildHorizontalList(halfConsonants3, screenHeight, screenWidth),
        ]
        ,Stack(
          children: [
            Container(
              height: screenHeight*0.2,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Container(
                   height : screenHeight*0.2,
                  width: screenWidth*0.2,
                  child: TextButton(
                    onPressed: (){keyBoardChange();}
                    ,child:const Icon(Icons.pan_tool)),
                ),
               Container(
                  height : screenHeight*0.2,
                  width: screenWidth*0.2,
                  child: TextButton(onPressed: (){}, child:const Text("<>")),
              ),
              Container(
                   height : screenHeight*0.2,
                  width: screenWidth*0.2,
                  child: TextButton(
                    onPressed: (){}
                    ,child:const Icon(Icons.check_box_rounded)),
                ),
                ],                    
              ),
            ),],
        ),
        ],
      ),
    );
  }
  Widget buildHorizontalList(List<String> items, double screenHeight, double screenWidth)
  {
    return Container(
      height: screenHeight * 0.8 * 0.2,
      width: screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items.map((item) {
          return Expanded(
            child: Center(
              child: Keys(child: item,widthOf:  MediaQuery.of(context).size.width/items.length),
            ),
          );
        }).toList(),
      ),
    );
  }
}