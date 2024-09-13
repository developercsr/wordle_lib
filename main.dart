import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'Components/keyBoard.dart';
import 'Components/appBar.dart';
import 'Components/displayGrid.dart';
import 'package:sw/wordManaement/listOfWords.dart';
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
    double gridcellwidth=(screenHeight*0.6)/6;
    return 
    Consumer<Listofwords>(
      builder: ((context,listofWords_,child)=>listofWords_.app_ready?
      Scaffold(
          appBar:const AppBar1(),
          body:
          Stack(
            children:[
              Container(
                height: screenHeight*0.62,
                alignment: Alignment.center,
                width: screenWidth,
                child:Container(
                   width:gridcellwidth*listofWords_.wordlength,
                  alignment: Alignment.center
                  ,child: displayGrid())),
              Align(
                alignment: Alignment.bottomCenter,
                child :Container(
                height: 0.3*screenHeight,
                width: screenWidth,
                alignment: Alignment.bottomCenter,
                decoration:const BoxDecoration(
                  color: Colors.orange,
                  border: Border(
                    top: BorderSide(color: Colors.black)
                  )
                ),
                child:keyBoard(),
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