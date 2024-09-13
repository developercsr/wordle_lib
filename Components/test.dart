import 'dart:convert';
void  Word(String lastWord)
  {
    List<String> lastWords=lastWord.split("");
    List<String> wordsList=[];
    for(int i=0;i<lastWords.length;i++)
    {
      if(lastWords[i]=="्"&&i!=0)
        lastWords[i-1]=lastWords[i-1]+lastWords[i];
    }
     for(int i=0;i<lastWords.length;i++)
    {
      if(lastWords[i]!="्")
        wordsList.add(lastWords[i]);
    }
    print(wordsList);
  }
void main()
{
  String xxxx="[["","",""],[""],[""],[""]]";
  List<List<String>> yyyy=jsonDecode(xxxx).cast<List<String>>();
  print(yyyy);
}