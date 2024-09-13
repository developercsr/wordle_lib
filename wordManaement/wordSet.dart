import "dart:io";
/*class Wordset{
  Wordset();
  List<String> vowels=['अ', 'आ', 'इ', 'ई', 'उ', 'ऊ','ऋ','ए','ऐ','ओ','औ', 'अं', 'अः'];
  List<String> consonants=['क', 'ख', 'ग', 'घ', 'ङ','च', 'छ', 'ज', 'झ', 'ञ','ट', 'ठ', 'ड','ढ', 'ण','त', 'थ', 'द', 'ध', 'न','प', 'फ', 'ब', 'भ', 'म','य','र', 'ल', 'व', 'श', 'ष', 'स', 'ह','क्ष', 'त्र', 'ज्ञ'];
  List<String> half_vowels=['ा', 'ि', 'ी', 'ु', 'ू', 'ृ', 'ॄ', 'े', 'ै', 'ो', 'ौ', 'ं','ः'];
  List<String> half_consonants=['क्', 'ख्', 'ग्', 'घ्', 'ङ्','च्', 'छ्', 'ज्', 'झ्', 'ञ्','ट्', 'ठ्', 'ड्','ढ्', 'ण्','त्', 'थ्', 'द्', 'ध्', 'न्','प्', 'फ्', 'ब्', 'भ्', 'म्','य्','र्', 'ल्', 'व्', 'श्','ष्', 'स्', 'ह्','क्ष्', 'त्र्', 'ज्ञ्'];
  int wordLength=3;
  void wordPrint(word)
  {
    stdout.write(word);
  }
  void listGenerate()
  {
    
  }
  void wordset(letter)
  {
    List<List<String>> listOfWords=wordlengthSet(wordLength);
    if(vowels.contains(letter))
    {
      listOfWords.forEach((element)
      {
        element.forEach((prelet)
        {
          if(prelet=="")
          {
            letter=letter;
          }
        });
      });
    }
     else if(consonants.contains(letter))
    {
      listOfWords.forEach((element)
      {
        element.forEach((prelet)
        {
          if(prelet=="")
          {
            letter=letter;
          }
        });
      });
    }
    else if(half_vowels.contains(letter))
    {
      listOfWords.forEach((element)
      {
        for(int index=0;index<element.length;index=index+1)
        {
          if(element[index]=="" && index!=0)
          {
            element[index-1]=element[index-1]+letter;
          }
          else{
            element[index]=element[index]+letter;
          }
        }
      });
    }
    else if(half_consonants.contains(letter))
    {
      listOfWords.forEach((element)
      {
        for(int index=0;index<element.length;index=index+1)
        {
          if(element[index]=="" && index!=0)
          {
            element[index-1]=letter+element[index-1];
          }
          else{
            element[index]=letter+element[index];
          }
        }
      });
    } else{}
    stdout.write("\n");
    stdout.write("The Updated List : ");
    stdout.write(listOfWords);
  }
  List<List<String>> wordlengthSet(legthOfWord)
  {
    wordLength=legthOfWord;
    List<String> word =List.filled(wordLength, "");
    List<List<String>> listOfWords=List.filled(6, word);
    stdout.write("List Of Words : ");
    stdout.write(listOfWords);
    return listOfWords;
  }
}
*/
List<List<String>> wordlengthSet(legthOfWord)
  {
    int wordLength=legthOfWord;
    List<String> word =List.filled(wordLength, "");
    List<List<String>> listOfWords=List.filled(6, word);
    stdout.write("List Of Words : ");
    stdout.write(listOfWords);
    return listOfWords;
  }
/*
void main()
{
  var Word=Wordset();
  List<String> testWord=["म","ह","ा","भ","ा","र","त","म्"];
  testWord.forEach((element)
  {
    stdout.write(element);
    Word.wordset(element);
  });
}*/

// void _loadWords() async
  // {
  //   int word_num=0;
  //   int letter_num=0;
  //   SharedPreferences prefs=await SharedPreferences.getInstance();
  //   listOfWords.forEach((word)
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
  //           letter_num++;
  //         }
  //       });
  //     }
  //   else{
  //   word_num++;
  //   }
  //   prefs.setInt("word_num", word_num);
  //   prefs.setInt("letter_num", letter_num);
  // });
  // print("All are stored");
  // print(word_num);
  // print(letter_num);
  // }