import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'Components/appBar.dart';
import 'Components/displayGrid.dart';
import 'package:sw/wordManaement/listOfWords.dart';
import 'package:sw/Components/webKeys1.dart';
import 'package:sw/Components/webkeys2.dart';
void main()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context)=>Listofwords())
          ]
        ,child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor:const Color.fromARGB(255, 162, 218, 22)),
          useMaterial3: true,
      
        ),
        home:  MyHomePage(),
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>
{
  @override
  Widget build(BuildContext context)
  {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return 
    Consumer<Listofwords>(
      builder: ((context,listofWords_,child)=>listofWords_.app_ready?
      Scaffold(
          appBar:const AppBar1(),
          body:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              Container(
                height: screenHeight,
                width: screenWidth*0.33,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 252, 151),
                  border: Border.all(
                  color: Colors.blueAccent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10.0),),
                child: webkeyspad1(),
              ),
              Container(
                height: screenHeight,
                width: screenWidth*0.33,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 252, 151),
                  border: Border.all(
                  color: Colors.blueAccent,
                  width: 0.5,
                )
                ,borderRadius: BorderRadius.circular(10.0),
                ),
                child:Webkeys2()
                ),
                Container(
                height: screenHeight,
                width: screenWidth*0.33,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 252, 151),
                  border: Border.all(
                  color: Colors.blueAccent,
                  width: 0.5,
                )
                ,borderRadius: BorderRadius.circular(10.0),
                ),
                child: LayoutBuilder(
                builder: (context, constraints) {
                double totalHeight = constraints.maxHeight;
                double height90Percent = totalHeight * 0.95;
                double height10Percent = totalHeight * 0.05;
                return Column(
                  children: [
                    Container(
                      child: Container(
                        height: height90Percent,
                        width: ((height90Percent)/6)*listofWords_.wordlength,
                        child: displayGrid(),
                      ),
                    ),
                    Container(
                      height: height10Percent,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 90, 255, 53),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                      ),
                      child: 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(onPressed:(){ listofWords_.checkthewords(context);}, icon: Icon(Icons.check_box_rounded)),
                          IconButton(onPressed: () { listofWords_.removelastEntry(context); }, icon: Icon(Icons.clear_sharp)),
                        ],
                      )
                    ),
                  ],
                );
              },
            ),
            ),
           ],
          ),
         ) 
    :Container(
      child: const CircularProgressIndicator(),
    )));
  }
}