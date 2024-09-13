import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// wordlength
// wordnum 
// letternum
// wordslist3
// wordslist4
// wordslist5

class Listofwords extends ChangeNotifier
{ 
  int wordnum=0;
  int letternum=0;
  int wordlength=3;
  bool app_ready=false;
  List<List<String>> wordslists=[[""]];
  List<String> vowels=['अ', 'आ', 'इ', 'ई', 'उ', 'ऊ','ऋ','ए','ऐ','ओ','औ', 'अं', 'अः'];
  List<String> consonants=['क', 'ख', 'ग', 'घ', 'ङ','च', 'छ', 'ज', 'झ', 'ञ','ट', 'ठ', 'ड','ढ', 'ण','त', 'थ', 'द', 'ध', 'न','प', 'फ', 'ब', 'भ', 'म','य','र', 'ल', 'व', 'श', 'ष', 'स', 'ह','क्ष', 'त्र', 'ज्ञ'];
  List<String> halfvowels=['ा', 'ि', 'ी', 'ु', 'ू', 'ृ', 'ॄ', 'े', 'ै', 'ो', 'ौ', 'ं','ः'];
  List<String> halfConsonants=['क्', 'ख्', 'ग्', 'घ्', 'ङ्','च्', 'छ्', 'ज्', 'झ्', 'ञ्','ट्', 'ठ्', 'ड्','ढ्', 'ण्','त्', 'थ्', 'द्', 'ध्', 'न्','प्', 'फ्', 'ब्', 'भ्', 'म्','य्','र्', 'ल्', 'व्', 'श्','ष्', 'स्', 'ह्','क्ष्', 'त्र्', 'ज्ञ्'];
  Listofwords()
  {
  startApp();
  }

  startApp() async
  {
    SharedPreferences pres=await SharedPreferences.getInstance();
    String wordslists3=pres.getString("wordslist3")??"";
    String wordslists4=pres.getString("wordslist4")??"";
    String wordslists5=pres.getString("wordslist5")??"";
    print(wordslists5);
    print(wordslists4);
    print(wordslists3);
    if(wordslists3==""){pres.setString("wordslist3", jsonEncode([["","",""],["","",""],["","",""],["","",""],["","",""],["","",""]]));}
    if(wordslists4==""){pres.setString("wordslist4", jsonEncode([["","","",""],["","","",""],["","","",""],["","","",""],["","","",""],["","","",""]]));}
    if(wordslists5==""){pres.setString("wordslist5", jsonEncode([["","","","",""],["","","","",""],["","","","",""],["","","","",""],["","","","",""],["","","","",""]]));}
    int? wordlength=pres.getInt("wordlength")??3;
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
  }

  Future<void> get_word() async
  {
    var url="http://127.0.0.1:5555/wordoftheday";
    var response=await  http.get(Uri.parse(url));
    final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    print(jsonResponse["word_of_day"]=="नमस्ते");
  }
  
  // void _loadData([int wordlength=3]) async
  // {
  //   List<List<String>> listOfWords=List<List<String>>.generate(6, (index) => List<String>.generate(wordlength, (index) => ''),);
  //   SharedPreferences prefs=await SharedPreferences.getInstance();
  //   prefs.setInt("wordlength", wordlength);
  //   String WordsString=prefs.getString("wordslist") ?? jsonEncode(listOfWords);
  //   print(jsonEncode(listOfWords));
  //   if(WordsString!=jsonEncode(listOfWords))
  //   {
  //     List<dynamic> jsonList = jsonDecode(WordsString);
  //     listOfWords = jsonList.map((e) => List<String>.from(e)).toList();
  //      listOfWords.forEach((word)
  //     {
  //     if(word.contains(""))
  //     { 
  //       word.forEach((letter)
  //       {
  //         if(letter=="")
  //         {
  //           return;
  //         }
  //         else{
  //           letternum++;
  //         }
  //       });
  //     }
  //   else{
  //   wordnum++;
  //   }
  //   prefs.setInt("word_num", wordnum);
  //   prefs.setInt("letter_num", letternum);
  //   prefs.setBool("gonext", true);
  // });
  //   }
  //   else
  //   {
  //     listOfWords=[["","",""],["","",""],["","",""],["","",""],["","",""],["","",""]];
  //     prefs.setString("wordslist", jsonEncode(listOfWords));
  //     prefs.setInt("word_num", 0);
  //     prefs.setInt("letter_num",0);
  //   }
  //   notifyListeners();
  // }
  

  void addWordsandLetters(String entry) async 
  {
  print("Namaste");
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
  //word forming here
  if(entryisOvwel) entryIsOvwel(entry, wordnum, letternum);
  if(entryishalsovwel) entryIshalfOvel(entry, wordnum, letternum);
  if(entryishalfconsonant) entryIsHalfConsonant(entry, wordnum, letternum);
  if(entryisconsonant) entryIsConsonant(entry, wordnum, letternum);
  //data stored here

  await prefs.setString(wordslistKey, jsonEncode(wordslists));
  await prefs.setInt(wordnumkey, wordnum);
  await prefs.setInt(letternumkey, letternum);
  //data updated here
  notifyListeners();
  }
  Future<void> chagingwordlength(int new_length) async
  {
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
    app_ready=true;
    wordlength=new_length;
    prefs.setString(wordslist_key,jsonEncode(wordslists));
    notifyListeners();
  }
  List<List<String>> generating(int generatelistoflength)
  {
    List<List<String>> wordsList=List.generate(6,(index)=>List<String>.generate(generatelistoflength,(index)=>""));
    return wordsList;
  }
  

  entryIsOvwel(String entry,int wordnum,int letternum) async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    int wordlength=prefs.getInt("wordlength")??0;
    String last=wordslists[wordnum][letternum];
    List<String> lastWordparts=last.split("");
    String wordnumkey="wordnum"+wordlength.toString();
    String letternumkey="letternum"+wordlength.toString();
    String wordslistKey="wordslist"+wordlength.toString();
    List<int> removeindex=[];
    for(int i=0;i<lastWordparts.length;i++)
    {
      if(lastWordparts[i]=="्"){lastWordparts[i-1]=lastWordparts[i-1]+"्";
      removeindex.add(i);}
    }
    // print(removeindex);
    removeindex.sort((a, b) => b.compareTo(a));
    // print(removeindex);
    removeindex.forEach((el){lastWordparts.removeAt(el);});
    // print(lastWordparts);
    bool isOvwel=lastWordparts.any((element) => vowels.contains(element));
    bool isConsonant=lastWordparts.any((element) => consonants.contains(element));
    bool ishalfOvwel=lastWordparts.any((element) => halfvowels.contains(element));
    bool ishalfConsonant=lastWordparts.any((element) => halfConsonants.contains(element));
    // print(wordslists[wordnum][letternum]);
    // print(wordnum);
    // print(letternum);
    // print(ishalfOvwel);
    // print(ishalfConsonant);
    // print(isOvwel);
    // print(isConsonant);
    
    if(ishalfConsonant&&ishalfOvwel&&(!isOvwel)&&(!isConsonant))
    {
      print("Please complete the before word!");
    }
    else if((wordnum==0||letternum==0) && last=="")
    {
      wordslists[wordnum][letternum]=entry;
    }
    else if((isOvwel || isConsonant) && letternum<wordlength-1 && wordnum<=5)
    {
      letternum+=1;
      wordslists[wordnum][letternum]=entry;
    }
    else if(((isOvwel || isConsonant) && letternum==wordlength-1) && wordnum<5)
    {
      wordnum+=1;
      letternum=0;
      wordslists[wordnum][letternum]=entry;
    }
    else if(ishalfConsonant && wordnum<6)
    {
      print("NOT possible to combine a Vowel with half Consonants");
    }
    else if(ishalfOvwel && wordnum<6)
    {
     print("NOT possible to combine a Vowel with half Vowel");
    }
    else if(wordnum==5 && letternum==wordlength-1)
    {
      print("Chances are Completed for today!");
    }
    else{print("something else");}
    
  await prefs.setString(wordslistKey, jsonEncode(wordslists));
  await prefs.setInt(wordnumkey, wordnum);
  await prefs.setInt(letternumkey, letternum);
  //data updated here
  notifyListeners();
    
    return;
  }


  entryIsConsonant(String entry,int wordnum,int letternum) async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    int wordlength=prefs.getInt("wordlength")??0;
    String last=wordslists[wordnum][letternum];
    List<String> lastWordparts=last.split("");
    String wordnumkey="wordnum"+wordlength.toString();
    String letternumkey="letternum"+wordlength.toString();
    String wordslistKey="wordslist"+wordlength.toString();
    List<int> removeindex=[];
    for(int i=0;i<lastWordparts.length;i++)
    {
      if(lastWordparts[i]=="्"){lastWordparts[i-1]=lastWordparts[i-1]+"्";
      removeindex.add(i);}
    }
    print(removeindex);
    removeindex.sort((a, b) => b.compareTo(a));
    // print(removeindex);
    removeindex.forEach((el){lastWordparts.removeAt(el);});
    // print(lastWordparts);
    bool isOvwel=lastWordparts.any((element) => vowels.contains(element));
    bool isConsonant=lastWordparts.any((element) => consonants.contains(element));
    bool ishalfOvwel=lastWordparts.any((element) => halfvowels.contains(element));
    bool ishalfConsonant=lastWordparts.any((element) => halfConsonants.contains(element));
    print(wordslists[wordnum][letternum]);
    print(wordnum);
    print(letternum);
    print(isConsonant);
    print(isOvwel);
    print(ishalfConsonant);
    print(ishalfOvwel);
    if((wordnum==0||letternum==0) && last=="")wordslists[wordnum][letternum]=entry;
    else if((isOvwel || isConsonant) && letternum<wordlength-1 && wordnum<=5)
    {
      letternum+=1;
      wordslists[wordnum][letternum]=entry;
    }
    else if((isOvwel || isConsonant) && letternum==wordlength-1 && wordnum<=5)
    {
      wordnum+=1;
      letternum=0;
      wordslists[wordnum][letternum]=entry;
    }
    else if(ishalfOvwel && ishalfConsonant && wordnum<=5 && letternum<=wordlength-1 &&!isConsonant)
    {
      String word="";
      lastWordparts.insert(lastWordparts.length-1, entry);
      for(String ele in lastWordparts){word+=ele;}
      wordslists[wordnum][letternum]=word;
    }
    else if(ishalfConsonant && wordnum<=5 && letternum<=wordlength-1 && !isConsonant)
    {
      wordslists[wordnum][letternum]+=entry;
    }
    else if(ishalfOvwel && wordnum<5 && !isConsonant)
    {
      wordslists[wordnum][letternum]=entry+wordslists[wordnum][letternum];
    }
    else if(wordnum==5 && letternum==wordlength-1)print("Chances are Completed for today!");
    else{print("something else");}
    
    await prefs.setString(wordslistKey, jsonEncode(wordslists));
    await prefs.setInt(wordnumkey, wordnum);
    await prefs.setInt(letternumkey, letternum);
    //data updated here
    notifyListeners();
    
    return;

  }


  entryIsHalfConsonant(String entry,int wordnum,int letternum)async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    int wordlength=prefs.getInt("wordlength")??0;
    String last=wordslists[wordnum][letternum];
    List<String> lastWordparts=last.split("");
    String wordnumkey="wordnum"+wordlength.toString();
    String letternumkey="letternum"+wordlength.toString();
    String wordslistKey="wordslist"+wordlength.toString();
    List<int> removeindex=[];
    for(int i=0;i<lastWordparts.length;i++)
    {
      if(lastWordparts[i]=="्"){lastWordparts[i-1]=lastWordparts[i-1]+"्";
      removeindex.add(i);}
    }
    // print(removeindex);
    removeindex.sort((a, b) => b.compareTo(a));
    // print(removeindex);
    removeindex.forEach((el){lastWordparts.removeAt(el);});
    // print(lastWordparts);
    bool isOvwel=lastWordparts.any((element) => vowels.contains(element));
    bool isConsonant=lastWordparts.any((element) => consonants.contains(element));
    bool ishalfOvwel=lastWordparts.any((element) => halfvowels.contains(element));
    bool ishalfConsonant=lastWordparts.any((element) => halfConsonants.contains(element));
    // print(wordslists[wordnum][letternum]);
    // print(wordnum);
    // print(letternum);
    // print(isConsonant);
    // print(isOvwel);
    // print(ishalfConsonant);
    // print(ishalfOvwel);
    if((wordnum==0||letternum==0) && last=="")wordslists[wordnum][letternum]=entry;
    else if(isConsonant && letternum<=wordlength-1 && wordnum<=5)wordslists[wordnum][letternum]=entry+wordslists[wordnum][letternum];
    else if(isOvwel && letternum<wordlength-1 && wordnum<=5){
    letternum+=1;
    wordslists[wordnum][letternum]=entry;}
    else if(ishalfConsonant && ishalfConsonant && wordnum<5){
      wordslists[wordnum][letternum]=entry+wordslists[wordnum][letternum];
    }
    else if(isOvwel && letternum<=wordlength-1 && wordnum<=5){
      wordnum+=1;
      letternum=0;
      wordslists[wordnum][letternum]=entry;
    }
    else if(ishalfConsonant && wordnum<=5)wordslists[wordnum][letternum]=entry+wordslists[wordnum][letternum];
    else if(ishalfOvwel && wordnum<=5)wordslists[wordnum][letternum]=entry+wordslists[wordnum][letternum];
    else if(wordnum==5 && letternum==wordlength-1)print("Chances are Completed for today!");
    else{print("something else");}
    await prefs.setString(wordslistKey, jsonEncode(wordslists));
    await prefs.setInt(wordnumkey, wordnum);
    await prefs.setInt(letternumkey, letternum);
    //data updated here
    notifyListeners();
    return;
  }

  entryIshalfOvel(String entry,int wordnum,int letternum)async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    int wordlength=prefs.getInt("wordlength")??0;
    String last=wordslists[wordnum][letternum];
    List<String> lastWordparts=last.split("");
    String wordnumkey="wordnum"+wordlength.toString();
    String letternumkey="letternum"+wordlength.toString();
    String wordslistKey="wordslist"+wordlength.toString();
    bool isOvwel=lastWordparts.any((element) => vowels.contains(element));
    bool isConsonant=lastWordparts.any((element) => consonants.contains(element));
    bool ishalfOvwel=lastWordparts.any((element) => halfvowels.contains(element));
    bool ishalfConsonant=lastWordparts.any((element) => halfConsonants.contains(element));
    List<int> removeindex=[];
    for(int i=0;i<lastWordparts.length;i++)
    {
      if(lastWordparts[i]=="्"){lastWordparts[i-1]=lastWordparts[i-1]+"्";
      removeindex.add(i);}
    }
    // print(removeindex);
    removeindex.sort((a, b) => b.compareTo(a));
    // print(removeindex);
    removeindex.forEach((el){lastWordparts.removeAt(el);});
    // print(lastWordparts);
    // print(wordslists[wordnum][letternum]);
    // print(ishalfOvwel);
    // print(wordnum);
    // print(letternum);
    if(ishalfOvwel)
    {
      String word="";
      // print(lastWordparts);
      for(int i=0;i<lastWordparts.length;i++){if(halfvowels.contains(lastWordparts[i])){lastWordparts[i]=entry;}}
      // print(lastWordparts);
      for(var ele in lastWordparts)
      {
        word+=ele;
      }
      // print(word);
      wordslists[wordnum][letternum]=word;
    }
    else if((wordnum==0||letternum==0) && last=="")  wordslists[wordnum][letternum]=entry;
    else if(isConsonant && letternum<=wordlength-1 && wordnum<=5)wordslists[wordnum][letternum]+=entry;
    else if(isOvwel && wordnum<=5)
    {
      if(letternum<wordlength-1)
      {
        letternum+=1;
        wordslists[wordnum][letternum]=entry;
      }
      else if(letternum==wordlength-1)
      {
        letternum=0;
        wordnum+=1;
        wordslists[wordnum][letternum]=entry;
      }else{}
    }
    else if(ishalfConsonant && wordnum<6)
    {
      wordslists[wordnum][letternum]=wordslists[wordnum][letternum]+entry;
    }
    else if(ishalfOvwel && wordnum<6)
    {
      wordslists[wordnum][letternum]+=entry;
    }
    else if(wordnum==5 && letternum==wordlength-1)
    {
      print("Chances are Completed for today!");
    }
    else{print("something else");}
    
    await prefs.setString(wordslistKey, jsonEncode(wordslists));
    await prefs.setInt(wordnumkey, wordnum);
    await prefs.setInt(letternumkey, letternum);
    //data updated here
    notifyListeners();
    return;
  }
}