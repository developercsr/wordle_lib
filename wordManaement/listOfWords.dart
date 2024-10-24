import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:sw/Components/gridCell.dart';
import 'package:sw/Components/winningDialogue.dart';
import 'package:sw/Components/SnakBar.dart';
import 'package:sw/Components/chancesCompletedDialogueBox.dart';
// wordlength
// wordnum
// letternum
// wordslist3
// wordslist4
// wordslist5
class Listofwords extends ChangeNotifier
{
  int wordnum=0;
  Color gridCellColor=Color.fromARGB(255, 242, 254, 255);
  Color correctcellColor = Color.fromARGB(255, 26, 255, 0);
  Color mismatchingcolor=Color.fromARGB(255, 255, 149, 0);
  Color wordWord=Color.fromARGB(255, 255, 24, 24);
  int letternum =0;
  int wordlength=3;
  bool app_ready=false;
  List<List<gridCell>> displayGridCells=[];
  List<List<String>> wordslists=[[""]];
  List<List<Color>> colorsOfCells=[];
  List<String> vowels=['अ', 'आ', 'इ', 'ई', 'उ', 'ऊ','ऋ','ए','ऐ','ओ','औ', 'अं', 'अः'];
  List<String> consonants=['क', 'ख', 'ग', 'घ', 'ङ','च', 'छ', 'ज', 'झ', 'ञ','ट', 'ठ', 'ड','ढ', 'ण','त', 'थ', 'द', 'ध', 'न','प', 'फ', 'ब', 'भ', 'म','य','र', 'ल', 'व', 'श', 'ष', 'स', 'ह','क्ष', 'त्र', 'ज्ञ'];
  List<String> halfvowels=['ा', 'ि', 'ी', 'ु', 'ू', 'ृ', 'ॄ', 'े', 'ै', 'ो', 'ौ', 'ं','ः'];
  List<String> halfConsonants=['क्', 'ख्', 'ग्', 'घ्', 'ङ्','च्', 'छ्', 'ज्', 'झ्', 'ञ्','ट्', 'ठ्', 'ड्','ढ्', 'ण्','त्', 'थ्', 'द्', 'ध्', 'न्','प्', 'फ्', 'ब्', 'भ्', 'म्','य्','र्', 'ल्', 'व्', 'श्','ष्', 'स्', 'ह्','क्ष्', 'त्र्', 'ज्ञ्'];

  checkConditionAndShowToast(BuildContext context,String messege)
  {
    showToast(context, messege);
  }

  Listofwords()
  {
    startApp();
  }
  gridcellForming() async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    int wordlength=prefs.getInt("wordlength")??3;
    String wordslistKey="wordslist"+wordlength.toString();
    String colorsListKey="colorsOfCells"+wordlength.toString();
    String wordsJson=prefs.getString(wordslistKey)??"";
    String colorsString=prefs.getString(colorsListKey)??"";
    List<dynamic> clorsJson=jsonDecode(colorsString);
    colorsOfCells = clorsJson.map<List<Color>>((row) => row.map<Color>((colorValue) => Color(colorValue)).toList()).toList();
    List<dynamic> jsonOb=jsonDecode(wordsJson);
    List<List<gridCell>> formedCells=[];
    List<List<String>> wordslists = jsonOb.map((e) => List<String>.from(e)).toList();
    for(int i=0;i<wordslists.length;i++)
    {
      List<gridCell> purposeList=[];
      for(int j=0;j<wordslists[i].length;j++)
      {
        purposeList.add(gridCell(name: wordslists[i][j],backGroundClour: colorsOfCells[i][j],)); 
      }
      formedCells.add(purposeList);
    }
    displayGridCells=formedCells;
    app_ready=true;
    colorGen();
    notifyListeners();
  }

  List<List<Color>> colorGen({int wordlength=3}) 
  {
    List<List<Color>> colorsOfCells = List.generate(6,(_) => List.generate(wordlength, (_) =>const Color.fromARGB(255, 242, 254, 255)),);
    return colorsOfCells;
  }

  startApp() async
  {
    SharedPreferences pres=await SharedPreferences.getInstance();
    String wordslists3=pres.getString("wordslist3")??"";
    String wordslists4=pres.getString("wordslist4")??"";
    String wordslists5=pres.getString("wordslist5")??"";
    String colorsOfCells3=pres.getString("colorsOfCells3")??"";
    String colorsOfCells4=pres.getString("colorsOfCells4")??"";
    String colorsOfCells5=pres.getString("colorsOfCells5")??"";
    bool? isgotAnswer3=pres.getBool("isgotAnswer3");
    if(isgotAnswer3==null){
      isgotAnswer3=false;
      pres.setBool("isgotAnswer3", false);
    }
    bool? isgotAnswer4=pres.getBool("isgotAnswer4");
    if(isgotAnswer4==null){
      isgotAnswer4=false;
      pres.setBool("isgotAnswer4", false);
    }
    bool? isgotAnswer5=pres.getBool("isgotAnswer5");
    if(isgotAnswer5==null){
      isgotAnswer5=false;
      pres.setBool("isgotAnswer5", false);
    }
    pres.setBool("hint1used", false);
    pres.setInt("hint1atword", 0);
    if(wordslists3==""){pres.setString("wordslist3", jsonEncode([["","",""],["","",""],["","",""],["","",""],["","",""],["","",""]]));}
    if(wordslists4==""){pres.setString("wordslist4", jsonEncode([["","","",""],["","","",""],["","","",""],["","","",""],["","","",""],["","","",""]]));}
    if(wordslists5==""){pres.setString("wordslist5", jsonEncode([["","","","",""],["","","","",""],["","","","",""],["","","","",""],["","","","",""],["","","","",""]]));}
    List<List<Color>> col3=colorGen(wordlength: 3);
    List<List<Color>> col4=colorGen(wordlength: 4);
    List<List<Color>> col5=colorGen(wordlength: 5);
    List<List<int>> colorValues3 = col3.map((innerList) =>innerList.map((color) => color.value).toList()).toList();
    List<List<int>> colorValues4 = col4.map((innerList) =>innerList.map((color) => color.value).toList()).toList();
    List<List<int>> colorValues5 = col5.map((innerList) =>innerList.map((color) => color.value).toList()).toList();
    if(colorsOfCells3==""){pres.setString("colorsOfCells3", jsonEncode(colorValues3));}
    if(colorsOfCells4==""){pres.setString("colorsOfCells4", jsonEncode(colorValues4));}
    if(colorsOfCells5==""){pres.setString("colorsOfCells5", jsonEncode(colorValues5));}
    bool? isCheckedtry=pres.getBool("isChecked");
    if(isCheckedtry==null)
    {
      pres.setBool("isChecked", false);
    }
    int? wordlength=pres.getInt("wordlength")??3;
    pres.setString("correctString3", "नमस्ते");
    pres.setString("correctString4", "कास्टेफाली");
    pres.setString("correctString5", "धर्मशास्त्राणि");
    int wordnum3=pres.getInt("wordnum3")??0;
    int letternum3=pres.getInt("letternum3")??0;
    int wordnum4=pres.getInt("wordnum4")??0;
    int letternum4=pres.getInt("letternum4")??0;
    int wordnum5=pres.getInt("wordnum5")??0;
    int letternum5=pres.getInt("letternum5")??0;
    if(wordnum3==0){pres.setInt("wordnum3", 0);}
    if(letternum3==0){pres.setInt("letternum3", 0);}
    if(wordnum4==0){pres.setInt("wordnum4", 0);}
    if(letternum4==0){pres.setInt("letternum4", 0);}
    if(wordnum5==0){pres.setInt("wordnum5", 0);}
    if(letternum5==0){pres.setInt("letternum5", 0);}
    chagingwordlength(wordlength);
    gridcellForming();
  }

  addWordsandLetters(BuildContext context,String entry) async {
    // checkConditionAndShowToast(context,"I am Called");
    SharedPreferences prefs=await SharedPreferences.getInstance();
    int lengthword=prefs.getInt("wordlength")??3;
    String wordnumkey="wordnum"+lengthword.toString();
    String letternumkey="letternum"+lengthword.toString();
    String wordslistKey="wordslist"+lengthword.toString();
    int wordnum=prefs.getInt(wordnumkey)??3;
    int letternum=prefs.getInt(letternumkey)??0;
    bool entryisOvwel=vowels.contains(entry);
    bool entryisconsonant=consonants.contains(entry);
    bool entryishalsovwel=halfvowels.contains(entry);
    bool entryishalfconsonant=halfConsonants.contains(entry);
    String isgotAnswerKey="isgotAnswer"+wordlength.toString();
    bool isgotAnswer = prefs.getBool(isgotAnswerKey)??false;
    if(isgotAnswer)
    {
      winningDialogue(context);
      return;
    }
    //word forming here
    if(entryisOvwel) entryIsOvwel(context,entry, wordnum, letternum);
    if(entryisconsonant) entryIsConsonant(context,entry, wordnum, letternum);
    if(entryishalsovwel) entryIshalfOvel(context,entry, wordnum, letternum);
    if(entryishalfconsonant) entryIsHalfConsonant(context,entry, wordnum, letternum);
    //data stored here
    await prefs.setString(wordslistKey, jsonEncode(wordslists));
    await prefs.setInt(wordnumkey, wordnum);
    await prefs.setInt(letternumkey, letternum);
    //data updated here
    gridcellForming();
    notifyListeners();
    //checking purpose
  }

  Future<void> chagingwordlength(int new_length) async
  {
    app_ready=false;
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String wordslist_key="wordslist"+new_length.toString();
    String wordslistsString=prefs.getString(wordslist_key)??"";
    if(wordslistsString=="")
    {
      wordslists=generating(new_length);
    }
    else
    {
      List<dynamic> jsonOb=jsonDecode(wordslistsString);
      wordslists = jsonOb.map((e) => List<String>.from(e)).toList();
    }
    prefs.setInt("wordlength",new_length);
    wordlength=new_length;
    prefs.setString(wordslist_key,jsonEncode(wordslists));
    gridcellForming();
    notifyListeners();
  }

  List<List<String>> generating(int generatelistoflength)
  {
    List<List<String>> wordsList=List.generate(6,(index)=>List<String>.generate(generatelistoflength,(index)=>""));
    return wordsList;
  }

  entryIsOvwel(context,String entry,int wordnum,int letternum) async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    int wordlength=prefs.getInt("wordlength")??0;
    String last=wordslists[wordnum][letternum];
    List<String> lastWordparts=last.split("");
    String wordnumkey="wordnum"+wordlength.toString();
    String letternumkey="letternum"+wordlength.toString();
    String wordslistKey="wordslist"+wordlength.toString();
    List<int> removeindex=[];
    bool isChecked = prefs.getBool("isChecked")??true;
    for(int i=0;i<lastWordparts.length;i++)
    {
      if(lastWordparts[i]=="्"){lastWordparts[i-1]=lastWordparts[i-1]+"्";
      removeindex.add(i);}
    }
    removeindex.sort((a, b) => b.compareTo(a));
    removeindex.forEach((el){lastWordparts.removeAt(el);});
    bool isOvwel=lastWordparts.any((element) => vowels.contains(element));
    bool isConsonant=lastWordparts.any((element) => consonants.contains(element));
    bool ishalfOvwel=lastWordparts.any((element) => halfvowels.contains(element));
    bool ishalfConsonant=lastWordparts.any((element) => halfConsonants.contains(element));
    if(last=="")//(wordnum==0 && letternum==0 && last=="")
    {
      wordslists[wordnum][letternum]=entry;
      prefs.setBool("isChecked", false);
      allentries(entry);
    }
    else if(isOvwel)
    {
      if(wordnum<5 && letternum<wordlength-1)
      {
        letternum+=1;
        wordslists[wordnum][letternum]=entry;
        allentries(entry);
      }
      else if(wordnum<5 && letternum==wordlength-1 && !isChecked)
      {
        checkConditionAndShowToast(context, "please Complete the Checking Of the Before Word !");
      }
      else if(wordnum==5 && letternum<wordlength-1)
      {
        letternum+=1;
        wordslists[wordnum][letternum]=entry;
        allentries(entry);
      }
      else if(wordnum<5 && letternum==wordlength-1 && isChecked)
      {
        wordnum+=1;
        letternum=0;
        wordslists[wordnum][letternum]=entry;
        prefs.setBool("isChecked", false);
        allentries(entry);
      }
      else if(wordnum==5 && letternum==wordlength-1 && !isChecked)
      {
        checkConditionAndShowToast(context, "please Complete the Checking of before word");
      }
      else if(wordnum==5 && letternum==wordlength-1 && isChecked)
      {
        checkConditionAndShowToast(context, "Chances are Completed for this Day");
        chancesCompleted(context);
      }
      else{
        checkConditionAndShowToast(context, "Something went Wrong!");
        }
    }
    else if(isConsonant)
    {
      if(wordnum<5 && letternum<wordlength-1)
      {
        letternum+=1;
        wordslists[wordnum][letternum]=entry;
        allentries(entry);
      }
      else if(wordnum<5 && letternum==wordlength-1 && !isChecked)
      {
        checkConditionAndShowToast(context, "please Complete the Checking Of the Before Word !");
      }
      else if(wordnum<5 && letternum==wordlength-1 && isChecked)
      {
        wordnum+=1;
        letternum=0;
        wordslists[wordnum][letternum]=entry;
        allentries(entry);
      }
      else if(wordnum==5 && letternum<wordlength-1)
      {
        letternum+=1;
        wordslists[wordnum][letternum]=entry;
        allentries(entry);
      }
      else if(wordnum==5 && letternum==wordlength-1 && !isChecked)
      {
        checkConditionAndShowToast(context, "please Complete the Checking Of the Before Word !");
      }
      else if(wordnum==5 && letternum==wordlength-1 && isChecked)
      {
        chancesCompleted(context);
      }
      else checkConditionAndShowToast(context,"Something went Wrong!");
    }
    else if(ishalfConsonant || ishalfOvwel)
    {
      checkConditionAndShowToast(context, "Not Possible like this !");
    }
  await prefs.setString(wordslistKey, jsonEncode(wordslists));
  await prefs.setInt(wordnumkey, wordnum);
  await prefs.setInt(letternumkey, letternum);
  //data updated here
  notifyListeners();
    return;
  }

  entryIsConsonant(context,String entry,int wordnum,int letternum) async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    int wordlength=prefs.getInt("wordlength")??0;
    String last=wordslists[wordnum][letternum];
    List<String> lastWordparts=last.split("");
    String wordnumkey="wordnum"+wordlength.toString();
    String letternumkey="letternum"+wordlength.toString();
    String wordslistKey="wordslist"+wordlength.toString();
    bool isChecked=prefs.getBool("isChecked")??true;
    List<int> removeindex=[];
    for(int i=0;i<lastWordparts.length;i++)
    {
      if(lastWordparts[i]=="्"){lastWordparts[i-1]=lastWordparts[i-1]+"्";
      removeindex.add(i);}
    }
    removeindex.sort((a, b) => b.compareTo(a));
    removeindex.forEach((el){lastWordparts.removeAt(el);});
    bool isOvwel=lastWordparts.any((element) => vowels.contains(element));
    bool isConsonant=lastWordparts.any((element) => consonants.contains(element));
    bool ishalfOvwel=lastWordparts.any((element) => halfvowels.contains(element));
    bool ishalfConsonant=lastWordparts.any((element) => halfConsonants.contains(element));
    if(last=="")//((wordnum==0||letternum==0) && last=="")
    {
      wordslists[wordnum][letternum]=entry;
      prefs.setBool("isChecked", false);
      allentries(entry);
    }
    else if(isOvwel)
    {
      if(wordnum<5 && letternum<wordlength-1)
      {
       letternum+=1;
       wordslists[wordnum][letternum]=entry;
       allentries(entry);
      }
      else if(wordnum<5 && letternum==wordlength-1 && !isChecked)
      {
        checkConditionAndShowToast(context, "please Check the Before word !");
      }
      else if(wordnum<5 && letternum==wordlength-1 && isChecked)
      {
        wordnum+=1;
        letternum=0;
        wordslists[wordnum][letternum]=entry;
        prefs.setBool("isChecked", false);
        allentries(entry);
      }
      else if(wordnum==5 && letternum<wordlength-1)
      {
        letternum+=1;
        wordslists[wordnum][letternum]=entry;
        allentries(entry);
      }
      else if(wordnum==5 && letternum==wordlength-1 && !isChecked)
      {
        checkConditionAndShowToast(context, "please Check the Before word !");
      }
      else if(wordnum==5 && letternum==wordlength-1 && isChecked)
      {
        chancesCompleted(context);
        checkConditionAndShowToast(context, "Chances are Completed for this day");
      }
      else
      {
        checkConditionAndShowToast(context, "Some thing Went wrong");
      }
    }
    else if(isConsonant)
    {
      if(wordnum<5 && letternum<wordlength-1)
      {
       letternum+=1;
       wordslists[wordnum][letternum]=entry;
       allentries(entry);
      }
      else if(wordnum<5 && letternum==wordlength-1 && !isChecked)
      {
        checkConditionAndShowToast(context, "please Check the Before word !");
      }
      else if(wordnum<5 && letternum==wordlength-1 && isChecked)
      {
        wordnum+=1;
        letternum=0;
        wordslists[wordnum][letternum]=entry;
        prefs.setBool("isChecked", false);
        allentries(entry);
      }
      else if(wordnum==5 && letternum<wordlength-1)
      {
        letternum+=1;
        wordslists[wordnum][letternum]=entry;
        allentries(entry);
      }
      else if(wordnum==5 && letternum==wordlength-1 && !isChecked)
      {
        checkConditionAndShowToast(context, "please Check the Before word !");
      }
      else if(wordnum==5 && letternum==wordlength-1 && isChecked)
      {
        chancesCompleted(context);
        checkConditionAndShowToast(context, "Chances are Completed for this day");
      }
      else
      {
        checkConditionAndShowToast(context, "Some thing Went wrong");
      }
    }
    else if(ishalfOvwel && ishalfConsonant)
    {
      String word="";
      lastWordparts.insert(lastWordparts.length-1, entry);
      for(String ele in lastWordparts){word+=ele;}
      wordslists[wordnum][letternum]=word;
      allentries(entry);
    }
    else if(ishalfConsonant)
    {
      String word="";
      lastWordparts.insert(lastWordparts.length, entry);
      for(String ele in lastWordparts){word+=ele;}
      wordslists[wordnum][letternum]=word;
      allentries(entry);
    }
    else if(ishalfOvwel)
    {
      String word="";
      lastWordparts.insert(lastWordparts.length-1, entry);
      for(String ele in lastWordparts){word+=ele;}
      wordslists[wordnum][letternum]=word;
      allentries(entry);
    }
    else 
    {
      checkConditionAndShowToast(context, "Something went wrong!");
    }
    await prefs.setString(wordslistKey, jsonEncode(wordslists));
    await prefs.setInt(wordnumkey, wordnum);
    await prefs.setInt(letternumkey, letternum);
    notifyListeners();
    return;

  }

  entryIsHalfConsonant(context,String entry,int wordnum,int letternum)async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    int wordlength=prefs.getInt("wordlength")??0;
    String last=wordslists[wordnum][letternum];
    List<String> lastWordparts=last.split("");
    String wordnumkey="wordnum"+wordlength.toString();
    String letternumkey="letternum"+wordlength.toString();
    String wordslistKey="wordslist"+wordlength.toString();
    List<int> removeindex=[];
    bool isChecked=prefs.getBool("isChecked")??true;
    for(int i=0;i<lastWordparts.length;i++)
    {
      if(lastWordparts[i]=="्"){lastWordparts[i-1]=lastWordparts[i-1]+"्";
      removeindex.add(i);}
    }
    removeindex.sort((a, b) => b.compareTo(a));
    removeindex.forEach((el){lastWordparts.removeAt(el);});
    bool isOvwel=lastWordparts.any((element) => vowels.contains(element));
    bool isConsonant=lastWordparts.any((element) => consonants.contains(element));
    bool ishalfOvwel=lastWordparts.any((element) => halfvowels.contains(element));
    bool ishalfConsonant=lastWordparts.any((element) => halfConsonants.contains(element));
    if(last=="")//((wordnum==0||letternum==0) && last=="")
    {
      wordslists[wordnum][letternum]=entry;
      prefs.setBool("isChecked", false);
      allentries(entry);
    }
    else if(isOvwel)
    {
      if(wordnum<5 && letternum<wordlength-1)
      {
        letternum+=1;
        wordslists[wordnum][letternum]=entry;
        allentries(entry);
      }
      else if(wordnum<5 && letternum==wordlength-1 && !isChecked)
      {
        checkConditionAndShowToast(context, "Not Possible !");
      }
      else if(wordnum==5 && letternum<wordlength-1)
      {
        letternum+=1;
        wordslists[wordnum][letternum]=entry;
        allentries(entry);
      }
      else if(wordnum<5 && letternum==wordlength-1 && isChecked)
      {
        wordnum+=1;
        letternum=0;
        wordslists[wordnum][letternum]=entry;
        prefs.setBool("isChecked", false);
        allentries(entry);
      }
      else if(wordnum==5 && letternum==wordlength-1 && !isChecked)
      {
        checkConditionAndShowToast(context, "please Complete the Checking of before word");
      }
      else if(wordnum==5 && letternum==wordlength-1 && isChecked)
      {
        chancesCompleted(context);
        checkConditionAndShowToast(context, "Chances are Completed for this Day");
      }
      else 
      {
        checkConditionAndShowToast(context, "Something went Wrong!");
      }
    }
    else if(isConsonant)
    {
      if(wordnum<5 && letternum<wordlength-1)
      {
        wordslists[wordnum][letternum]=entry+wordslists[wordnum][letternum];
        allentries(entry);
      }
      else if(wordnum<5 && letternum<=wordlength-1 && !isChecked)
      {
        wordslists[wordnum][letternum]=entry+wordslists[wordnum][letternum];
        allentries(entry);
      }
      else if(wordnum<5 && letternum==wordlength-1 && isChecked)
      {
        wordnum+=1;
        letternum=0;
        wordslists[wordnum][letternum]=entry;
        prefs.setBool("isChecked", false);
        allentries(entry);
      }
      else if(wordnum==5 && letternum<=wordlength-1 && !isChecked)
      {
        wordslists[wordnum][letternum]=entry+wordslists[wordnum][letternum];
        allentries(entry);
      }
      else if(wordnum==5 && letternum==wordlength-1 && isChecked)
      {
        chancesCompleted(context);
        checkConditionAndShowToast(context, "Chances are Completed for this Day");
      }
      else 
      {
        checkConditionAndShowToast(context, "Something went Wrong!");
      }
    }

    else if(ishalfConsonant || ishalfOvwel)
    {
      if(wordnum<5 && letternum<wordlength-1)
      {
        wordslists[wordnum][letternum]=entry+wordslists[wordnum][letternum];
        allentries(entry);
      }
      else if(wordnum<5 && letternum<=wordlength-1 && !isChecked)
      {
        wordslists[wordnum][letternum]=entry+wordslists[wordnum][letternum];
        allentries(entry);
      }
      else if(wordnum<5 && letternum==wordlength-1 && isChecked)
      {
        wordnum+=1;
        letternum=0;
        wordslists[wordnum][letternum]=entry;
        prefs.setBool("isChecked", false);
        allentries(entry);
      }
      else if(wordnum==5 && letternum<=wordlength-1 && !isChecked)
      {
        wordslists[wordnum][letternum]=entry+wordslists[wordnum][letternum];
        allentries(entry);
      }
      else if(wordnum==5 && letternum==wordlength-1 && isChecked)
      {
        chancesCompleted(context);
        checkConditionAndShowToast(context, "Chances are Completed for this Day");
      }
      else 
      {
        checkConditionAndShowToast(context, "Something went Wrong!");
      }
    }
    else 
    {
      checkConditionAndShowToast(context, "Something went Wrong!");
    }
    await prefs.setString(wordslistKey, jsonEncode(wordslists));
    await prefs.setInt(wordnumkey, wordnum);
    await prefs.setInt(letternumkey, letternum);
    //data updated here
    notifyListeners();
    return;
  }

  entryIshalfOvel(context,String entry,int wordnum,int letternum)async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    int wordlength=prefs.getInt("wordlength")??0;
    String last=wordslists[wordnum][letternum];
    List<String> lastWordparts=last.split("");
    String wordnumkey="wordnum"+wordlength.toString();
    String letternumkey="letternum"+wordlength.toString();
    String wordslistKey="wordslist"+wordlength.toString();
    bool isOvwel=lastWordparts.any((element)=>vowels.contains(element));
    bool isConsonant=lastWordparts.any((element)=>consonants.contains(element));
    bool ishalfOvwel=lastWordparts.any((element)=>halfvowels.contains(element));
    bool ishalfConsonant=lastWordparts.any((element)=>halfConsonants.contains(element));
    bool isChecked=prefs.getBool("isChecked")??true;
    List<int> removeindex=[];
    for(int i=0;i<lastWordparts.length;i++)
    {if(lastWordparts[i]=="्"){lastWordparts[i-1]=lastWordparts[i-1]+"्";removeindex.add(i);}}
    removeindex.sort((a, b) => b.compareTo(a));
    removeindex.forEach((el){lastWordparts.removeAt(el);});

    //first cell of the grid is null
    if(last=="")//((wordnum==0||letternum==0) && last=="")
    {
      wordslists[wordnum][letternum]=entry;
      allentries(entry);
      prefs.setBool("isChecked", false);
    }
    //if last cell has a vowel
    else if(isOvwel)
    {
      if(wordnum<5 && letternum<wordlength-1)
      {
        letternum+=1;
        wordslists[wordnum][letternum]=entry;
        allentries(entry);
      }
      else if(wordnum<5 && letternum==wordlength-1 && !isChecked)
      {
        checkConditionAndShowToast(context, "Not Possible!");
      }
      else if(wordnum==5 && letternum<wordlength-1)
      {
        wordslists[wordnum][letternum]+=entry;
        allentries(entry);
      }
      else if(wordnum<5 && letternum==wordlength-1 && isChecked)
      {
        wordnum+=1;
        letternum=0;
        wordslists[wordnum][letternum]=entry;
        prefs.setBool("isChecked", false);
        allentries(entry);
      }
      else if(wordnum==5 && letternum==wordlength-1 && !isChecked)
      {
        checkConditionAndShowToast(context, "please Complete the Checking of before word");
      }
      else if(wordnum==5 && letternum==wordlength-1 && isChecked)
      {
        chancesCompleted(context);
        checkConditionAndShowToast(context, "Chances are Completed for this Day");
      }
      else 
      {
        checkConditionAndShowToast(context, "Something went Wrong!");
      }
    }
    //if last cell has a consonant with half vowel
    else if(isConsonant && ishalfOvwel)
    {
      if(!isChecked)
      {
        String word="";
        lastWordparts[lastWordparts.length-1]=entry;
        lastWordparts.forEach((ele){word+=ele;});
        wordslists[wordnum][letternum]=word;
        allentries(entry);
      }
      else if(isChecked)
      {
        if(wordnum<5)
        {
          wordnum+=1;
          letternum=0;
          wordslists[wordnum][letternum]=entry;
          prefs.setBool("ischecked",false);
          allentries(entry);
        }
        else if(wordnum==5)
        {
          chancesCompleted(context);
          checkConditionAndShowToast(context, "Chances are Completed for this day");
        }
      }
    }

    else if(isConsonant && !ishalfOvwel)
    {
      if(wordnum<5 && letternum<wordlength-1)
      {
        wordslists[wordnum][letternum]+=entry;
        allentries(entry);
      }
      else if(wordnum<5 && letternum<=wordlength-1 && !isChecked)
      {
        wordslists[wordnum][letternum]+=entry;
        allentries(entry);
      }
      else if(wordnum<5 && letternum==wordlength-1 && isChecked)
      {
        wordnum+=1;
        letternum=0;
        wordslists[wordnum][letternum]+=entry;
        prefs.setBool("isChecked", false);
        allentries(entry);
      }
      else if(wordnum==5 && letternum<=wordlength-1 && !isChecked)
      {
        String word="";
        lastWordparts[lastWordparts.length-1]+=entry;
        lastWordparts.forEach((ele){word+=ele;});
        wordslists[wordnum][letternum]=word;
        allentries(entry);
      }
      else if(wordnum==5 && letternum==wordlength-1 && isChecked)
      {
        chancesCompleted(context);
        checkConditionAndShowToast(context, "Chances are Completed for this Day");
      }
      else
      {
        checkConditionAndShowToast(context, "Something went Wrong!");
      }
    }
    else if(ishalfConsonant)
    {
      if(wordnum<5 && letternum<wordlength-1)
      {
        wordslists[wordnum][letternum]+=entry;
        allentries(entry);
      }
      else if(wordnum<5 && letternum<=wordlength-1 && !isChecked)
      {
        wordslists[wordnum][letternum]=entry+wordslists[wordnum][letternum];
        allentries(entry);
      }
      else if(wordnum<5 && letternum==wordlength-1 && isChecked)
      {
        wordnum+=1;
        letternum=0;
        wordslists[wordnum][letternum]=entry;
        prefs.setBool("isChecked", false);
        allentries(entry);
      }
      else if(wordnum==5 && letternum<=wordlength-1 && !isChecked)
      {
        wordslists[wordnum][letternum]=entry+wordslists[wordnum][letternum];
        allentries(entry);
      }
      else if(wordnum==5 && letternum==wordlength-1 && isChecked)
      {
        chancesCompleted(context);
        checkConditionAndShowToast(context, "Chances are Completed for this Day");
      }
      else
      {
        checkConditionAndShowToast(context, "Something went wrong");
      }
    }

    else if(ishalfOvwel)
    {
      if(wordnum<5 && letternum<wordlength-1)
      {
        wordslists[wordnum][letternum]=entry;
        allentries(entry);
      }
      else if(wordnum<5 && letternum<=wordlength-1 && !isChecked)
      {
        wordslists[wordnum][letternum]=entry;
        allentries(entry);
      }
      else if(wordnum<5 && letternum==wordlength-1 && isChecked)
      {
        wordnum+=1;
        letternum=0;
        wordslists[wordnum][letternum]=entry;
        prefs.setBool("isChecked", false);
        allentries(entry);
      }
      else if(wordnum==5 && letternum<=wordlength-1 && !isChecked)
      {
        wordslists[wordnum][letternum]=entry;
        allentries(entry);
      }
      else if(wordnum==5 && letternum==wordlength-1 && isChecked)
      {
        chancesCompleted(context);
        checkConditionAndShowToast(context, "Chances are Completed for this Day");
      }
      else
      {
        checkConditionAndShowToast(context, "Something went wrong");
      }
    }
    else
      {
        checkConditionAndShowToast(context, "Something went wrong");
      }
    await prefs.setString(wordslistKey, jsonEncode(wordslists));
    await prefs.setInt(wordnumkey, wordnum);
    await prefs.setInt(letternumkey, letternum);
    notifyListeners();
    return;
  }

  userwordsplit(List<String> userword) async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    List<dynamic> userwordParts=[];
    for( String letter in userword)
    {
      List<String> letterSplit=letter.split("");
      List<int> removeOttu=[];
      for(int i=0;i<letterSplit.length;i++)
      {
        if(letterSplit[i]=="्")
        {
          letterSplit[i-1]=letterSplit[i-1]+"्";
          removeOttu.add(i);
        }
      }
      removeOttu.sort((a, b) => b.compareTo(a));
      removeOttu.forEach((el){letterSplit.removeAt(el);});
      userwordParts.add(letterSplit);
    }
  }

  checkthewords(BuildContext context) async
  { 
    // winningDialogue(context);
    SharedPreferences prefs=await SharedPreferences.getInstance();
    int wordlength=prefs.getInt("wordlength")??1;
    String colorCellsListKey="colorsOfCells"+wordlength.toString();
    String letternumKey="letternum"+wordlength.toString();
    int letternum=prefs.getInt(letternumKey)??0;
    String wordnumKey="wordnum"+wordlength.toString();
    int wordnum=prefs.getInt(wordnumKey)??0;
    String correctWordKey="correctString"+wordlength.toString();
    String last=wordslists[wordnum][letternum];
    List<String> lastWordparts=last.split("");
    List<int> removeindex=[];
    String isgotAnswerKey="isgotAnswer"+wordlength.toString();
    bool isgotAnswer = prefs.getBool(isgotAnswerKey)??false;
    if(isgotAnswer)
    {
      winningDialogue(context);
      return;
    }
    for(int i=0;i<lastWordparts.length;i++)
    {if(lastWordparts[i]=="्"){lastWordparts[i-1]=lastWordparts[i-1]+"्";
    removeindex.add(i);}}
    removeindex.sort((a, b) => b.compareTo(a));
    removeindex.forEach((el){lastWordparts.removeAt(el);});
    bool isOvwel=lastWordparts.any((element) => vowels.contains(element));
    bool isConsonant=lastWordparts.any((element) => consonants.contains(element));
    bool isChecked=prefs.getBool("isChecked")??true;
    if(letternum==wordlength-1 && letternum!=0)
    {
      if(isOvwel || isConsonant)
        {List<String> currentword=wordslists[wordnum];
        String correctString=prefs.getString(correctWordKey)??"";
        List<String> correctword=await returnCorrectWordParts(correctString);
        for(int i=0;i<currentword.length;i++)
        {
          if(currentword[i]==correctword[i]) 
          {
            displayGridCells[wordnum][i]=gridCell(name: wordslists[wordnum][i], backGroundClour: correctcellColor,);
            colorsOfCells[wordnum][i]=correctcellColor;
          }
          else if(correctword.contains(currentword[i]))
          {
            displayGridCells[wordnum][i]=gridCell(name: wordslists[wordnum][i], backGroundClour: mismatchingcolor,);
            colorsOfCells[wordnum][i]=mismatchingcolor;
          }
          else{}}
      }
      else
      {
        checkConditionAndShowToast(context,"Word Must Contain any Vowels or Consonants at the end");
        return;
      }
    }
    else{
      checkConditionAndShowToast(context, "Complete your Word!");
      return;
    }
    isgotAnswer=colorsOfCells[wordnum].every((ele)=>ele==correctcellColor);
    if(isgotAnswer) prefs.setBool(isgotAnswerKey, isgotAnswer);
    List<List<int>> colorValues = colorsOfCells.map((innerList) =>innerList.map((color) => color.value).toList()).toList();
    prefs.setString(colorCellsListKey,jsonEncode(colorValues));
    prefs.setBool("isChecked", true);
    notifyListeners();
  }

  Future<List<String>> returnCorrectWordParts(String correctone) async {
    List<String> vowels=['अ', 'आ', 'इ', 'ई', 'उ', 'ऊ','ऋ','ए','ऐ','ओ','औ', 'अं', 'अः'];
    List<String> consonants=['क', 'ख', 'ग', 'घ', 'ङ','च', 'छ', 'ज', 'झ', 'ञ','ट', 'ठ', 'ड','ढ', 'ण','त', 'थ', 'द', 'ध', 'न','प', 'फ', 'ब', 'भ', 'म','य','र', 'ल', 'व', 'श', 'ष', 'स', 'ह','क्ष', 'त्र', 'ज्ञ'];
    List<String> halfvowels=['ा', 'ि', 'ी', 'ु', 'ू', 'ृ', 'ॄ', 'े', 'ै', 'ो', 'ौ', 'ं','ः'];
    List<String> halfConsonants=['क्', 'ख्', 'ग्', 'घ्', 'ङ्','च्', 'छ्', 'ज्', 'झ्', 'ञ्','ट्', 'ठ्', 'ड्','ढ्', 'ण्','त्', 'थ्', 'द्', 'ध्', 'न्','प्', 'फ्', 'ब्', 'भ्', 'म्','य्','र्', 'ल्', 'व्', 'श्','ष्', 'स्', 'ह्','क्ष्', 'त्र्', 'ज्ञ्'];
    List<String> correctoneParts=correctone.split("");
    List<int> removeOttu=[];
    List<String> wordNotSplitted=[];
    for(int i=0;i<correctoneParts.length;i++)
    {
      if(correctoneParts[i]=="्")
      {
        correctoneParts[i-1]=correctoneParts[i-1]+"्";
        removeOttu.add(i);
      }
    }
    removeOttu.sort((a, b) => b.compareTo(a));
    removeOttu.forEach((el){correctoneParts.removeAt(el);});
    List<dynamic> correctWord=[];
    List<String> samyuklis=[];
    List<String> vowellis=[];
    for(int i=0;i<correctoneParts.length;i++)
    {
      bool ispartisOvwel= vowels.contains(correctoneParts[i]);
      bool ispartisConsonant= consonants.contains(correctoneParts[i]);
      bool ispartisHalfOvwel= halfvowels.contains(correctoneParts[i]);
      bool ispartishalfConsonant= halfConsonants.contains(correctoneParts[i]);
      if(ispartisOvwel)
      {
        vowellis.add(correctoneParts[i]);
        correctWord.add(vowellis);
      }
      else if(ispartisConsonant)
      {
        samyuklis.add(correctoneParts[i]);
        if(i<correctoneParts.length-1)
        {
          if(!halfvowels.contains(correctoneParts[i+1]))
          {
            correctWord.add(samyuklis);
            samyuklis=[];
          }
          else if(vowels.contains(correctoneParts[i+1]))
          {
            correctWord.add(samyuklis);
            samyuklis=[];
          }
          else if(halfConsonants.contains(correctoneParts[i+1])){}
          else if(halfvowels.contains(correctoneParts[i+1])){}
          else{
            }
        }
        else if(i==correctoneParts.length-1)
        {
          correctWord.add(samyuklis);
          samyuklis=[];
        }
        else{}

      }
      else if(ispartishalfConsonant)
      {        samyuklis.add(correctoneParts[i]);
      }
      else if(ispartisHalfOvwel)
      {
        samyuklis.add(correctoneParts[i]);
        correctWord.add(samyuklis);
        samyuklis=[];
      }
      else
      {
      }
    }
    for(List<String> i in correctWord)
    {
      String fullletter= "";
      for(String k in i)
      {
        fullletter+=k;
      }
      wordNotSplitted.add(fullletter);
    }
    return wordNotSplitted;
}

  allentries(entry) async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    int wordlength=prefs.getInt("wordlength")??3;
    String allentriesKey="allentries"+wordlength.toString();
    List<String> allentries=prefs.getStringList(allentriesKey)??[];
    allentries.add(entry);
    prefs.setStringList(allentriesKey,allentries);
  }

  wordMatching(List<dynamic> correctword, List<dynamic> userword)
  {
  List<dynamic> boolsOfMatching=[];
  int length=correctword.length;
  List<String> correctWordFlat=[];
  List<String> userWordFlat=[];
  String samyukta="";
  for(int m=0;m<correctword.length;m++)
  {
    for(int n=0;n<correctword[m].length;n++)
    {
      if(correctword[m].length>0)
      {
        if(n<(correctword[m].length-1)) samyukta+=correctword[m][n];
        else if(n==correctword[m].length-1){samyukta+=correctword[m][n]; correctWordFlat.add(samyukta);samyukta="";}
        else {}
      }
      else if(correctword[m].length==0) correctWordFlat.add(correctword[m][n]);
      else {
        // print("Something else happend !");
        }
    }
  }
  for(int m=0;m<userword.length;m++)
  {
    for(int n=0;n<userword[m].length;n++)
    {
      if(userword[m].length>0)
      {
        if(n<(userword[m].length-1)) samyukta+=userword[m][n];
        else if(n==userword[m].length-1){samyukta+=userword[m][n]; userWordFlat.add(samyukta);samyukta="";}
        else {
          // print("something went wrong !");
          }
      }
      else if(userword[m].length==0) userWordFlat.add(userword[m][n]);
      else {
        // print("Something else happend !");
        }
    }
  }

  for(int l=0;l<userWordFlat.length;l++)
  {
    if(userWordFlat[l]==correctWordFlat[l]) boolsOfMatching.add("Code :: Green");
    else if(correctWordFlat.contains(userWordFlat[l])) boolsOfMatching.contains("code :: Orange");
    else if(!correctWordFlat.contains(userWordFlat[l])) boolsOfMatching.add("Code :: Gray");
    else{
      //  print("Went Wrong!");
       }
  }
  }

  removelastEntry(BuildContext context) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int wordlength=prefs.getInt("wordlength")??3;
    String wordnumkey="wordnum"+wordlength.toString();
    String letternumKey="letternum"+wordlength.toString();
    String wordslistsKey="wordslist"+wordlength.toString();
    int wordnum=prefs.getInt(wordnumkey)??0;
    int letternum=prefs.getInt(letternumKey)??0;
    String allentriesKey="allentries"+wordlength.toString();
    List<String> allentries=prefs.getStringList(allentriesKey)??[];
    int lastIndex=allentries.length-1;
    if(lastIndex<0) lastIndex=0;
    if(allentries.length==0) return;
    String DeletingWord=allentries[lastIndex];
    bool deletingIsVowel = vowels.contains(DeletingWord);
    bool deletingIsConsonant = consonants.contains(DeletingWord);
    bool deletingIsHalfConsonant = halfConsonants.contains(DeletingWord);
    bool deletingIsHalfVowel = halfvowels.contains(DeletingWord);
    bool isChecked=prefs.getBool("isChecked")??true;
    List<String> LastWordParts=wordslists[wordnum][letternum].split("");
    List<int> removeindex=[];
    for(int i=0;i<LastWordParts.length;i++)
    {
      if(LastWordParts[i]=="्"){LastWordParts[i-1]=LastWordParts[i-1]+"्";
      removeindex.add(i);}
    }
    removeindex.sort((a, b) => b.compareTo(a));
    removeindex.forEach((el){LastWordParts.removeAt(el);});
    bool lastIsVowel=LastWordParts.any((element) => vowels.contains(element));
    bool lastIsConsonant=LastWordParts.any((element) => consonants.contains(element));
    if((letternum==wordlength-1 && (lastIsConsonant || lastIsVowel) && isChecked))
    {
      checkConditionAndShowToast(context,"Before word is alreadyu Checked!");
      return;
    }
    if(wordnum==0 && letternum==0 && wordslists[wordnum][letternum]=="") checkConditionAndShowToast(context,"Nothing to delete");
    else if(deletingIsVowel)
    {
      if(wordnum<5 && letternum<wordlength-1)
      {
        wordslists[wordnum][letternum]="";
        letternum-=1;
        if(letternum<0)letternum=0;
        if(allentries.length>=1)allentries.removeAt(allentries.length-1);
      }
      else if(wordnum<=5 && letternum==wordlength-1 && !isChecked)
      {
        wordslists[wordnum][letternum]="";
        letternum-=1;
        if(letternum<0)letternum=0;
        if(allentries.length>=1)allentries.removeAt(allentries.length-1);
      }
      else if(wordnum<5 && letternum==wordlength-1 && isChecked)
      {
        checkConditionAndShowToast(context,"Word is already Checked, No");
      }
      else if(wordnum==5 && letternum==wordlength-1 && isChecked)
      {
        checkConditionAndShowToast(context,"This Game is Completed!");
      }
      else checkConditionAndShowToast(context,"Something went Wrong!");
    }
    else if(deletingIsHalfConsonant || deletingIsHalfVowel || deletingIsConsonant)
    {
      if(wordnum<=5 && !isChecked)
        {
          if(LastWordParts.length==1)
          {
            wordslists[wordnum][letternum]="";
            letternum-=1;
            if(letternum<0)letternum=0;
            if(allentries.length>=1)allentries.removeAt(allentries.length-1);
          }
          else if(LastWordParts.length>1)
          {
            String word="";
            LastWordParts.remove(DeletingWord);
            for(String ele in LastWordParts){word+=ele;}
            wordslists[wordnum][letternum]=word;
            if(letternum<0)letternum=0;
            if(allentries.length>=1)
            {
              allentries.removeAt(allentries.length-1);
            }
          }
          else checkConditionAndShowToast(context,"Out of Contex");
        }
        else if(!isChecked) checkConditionAndShowToast(context,"Please Complete the Checking of before word!");
        else if(wordnum==5 && isChecked) checkConditionAndShowToast(context,"Chances are Completed For This day!");
        else checkConditionAndShowToast(context,"Something went Wrong");
    }
    else checkConditionAndShowToast(context,"Something is wrong!");

    gridcellForming();
    prefs.setInt(letternumKey,letternum);
    prefs.setInt(wordnumkey,wordnum);
    prefs.setStringList(allentriesKey, allentries);
    prefs.setString(wordslistsKey,jsonEncode(wordslists));
    prefs.setInt(letternumKey,letternum);
    notifyListeners();
  }

  reserAll(context) async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    int wordlength=prefs.getInt("wordlength")??3;
    String wordslistKey="wordslist"+wordlength.toString();
    String colorsListKey="colorsOfCells"+wordlength.toString();
    String wordnumKey="wordnum"+wordlength.toString();
    String letternumKey="letternum"+wordlength.toString();
    String isgotAnswerKey="isgotAnswer"+wordlength.toString();
    prefs.setString(wordslistKey, "");
    prefs.setString(colorsListKey, "");
    prefs.setInt(wordnumKey,0);
    prefs.setInt(letternumKey,0);
    prefs.setBool(isgotAnswerKey,false);
    startApp();
  }
}