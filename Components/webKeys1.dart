import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sw/wordManaement/listOfWords.dart';
import 'package:provider/provider.dart';
import 'package:sw/Components/webkeys.dart';
class webkeyspad1 extends StatefulWidget {
  @override
  State<webkeyspad1> createState() => _keysBoardState();
}
class _keysBoardState extends State<webkeyspad1> {
  final fulls=['अ', 'आ', 'इ', 'ई', 'उ', 'ऊ','ऋ','ए','ऐ','ओ','औ', 'अं', 'अः','क', 'ख', 'ग', 'घ', 'ङ','च', 'छ', 'ज', 'झ', 'ञ','ट', 'ठ', 'ड','ढ', 'ण','त', 'थ', 'द', 'ध', 'न','प', 'फ', 'ब', 'भ', 'म','य','र', 'ल', 'व', 'श', 'ष', 'स', 'ह','क्ष', 'त्र', 'ज्ञ'];
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
              itemCount: fulls.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 218, 232, 247),
                    border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255)
                    ),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                    child: Webkeys1(child: fulls[index]), // Your widget
                  );
              },
            );
          },
        ),
      ),)));}}
      
      
      
      
      
      
      
      
      
//       ListView(
//         physics:const NeverScrollableScrollPhysics(),
//         children: [
//           buildHorizontalList(fulls, screenHeight, screenWidth)
//         ,Stack(
//           children: [
//             Container(
//               height: screenHeight*0.2,
//               width: double.infinity,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//               Container(
//                    height : screenHeight*0.2,
//                   width: screenWidth*0.2,
//                   child: TextButton(
//                     onPressed: (){listofWords_.checkthewords(context);}
//                     ,child:const Icon(Icons.check_box_rounded)),
//                 ),
//                 Container(
//                   height : screenHeight*0.2,
//                   width: screenWidth*0.2,
//                   child: TextButton(onPressed: (){listofWords_.removelastEntry();}, child:Icon(Icons.highlight_remove)),
//               ),
//                 ],                    
//               ),
//             ),],
//         ),
//         ],
//       ),
//     )));
//   }
//   Widget buildHorizontalList(List<String> items, double screenHeight, double screenWidth)
//   {
//     return Container(
//       height: screenHeight/4,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: items.map((item) {
//           return Expanded(
//             child: Center(
//               child: Keys(child: item,widthOf:  MediaQuery.of(context).size.width/items.length),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }