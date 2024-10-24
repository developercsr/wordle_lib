import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sw/wordManaement/listOfWords.dart';
import 'package:provider/provider.dart';
import 'package:sw/Components/webkeys.dart';
class Webkeys2 extends StatefulWidget {
  @override
  State<Webkeys2> createState() => _keysBoardState();
}
class _keysBoardState extends State<Webkeys2> {
  final halfs=['ा', 'ि', 'ी', 'ु', 'ू', 'ृ', 'ॄ', 'े', 'ै', 'ो', 'ौ', 'ं','ः','क्', 'ख्', 'ग्', 'घ्', 'ङ्','च्', 'छ्', 'ज्', 'झ्', 'ञ्','ट्', 'ठ्', 'ड्','ढ्', 'ण्','त्', 'थ्', 'द्', 'ध्', 'न्','प्', 'फ्', 'ब्', 'भ्', 'म्','य्','र्', 'ल्', 'व्', 'श्','ष्', 'स्', 'ह्','क्ष्', 'त्र्', 'ज्ञ्'];
  @override
  Widget build(BuildContext context) {
    return Consumer<Listofwords>(
      builder: ((context,listofWords_,child)=>Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
          double maxWidth = constraints.maxWidth;
          double itemWidth = 70;
          int crossAxisCount = (maxWidth/itemWidth).floor();
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                childAspectRatio: 1.0,
              ),
              itemCount: halfs.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 218, 232, 247),
                    border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255)
                    ),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                    child: Webkeys1(child: halfs[index]), // Your widget
                  );
              },
            );
          },
        ),
      ),)));}}