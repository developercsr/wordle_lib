void main()
{
  List<String> mylis=[];
  List<List<String>> wordlist=[["A","B","C"],["D","E","F"],["G","H","I"],["J","K","L"],["M","N","O"],["P","Q","R"]];
  List<List<String>> wordslist2=[["1","2","3"],["4","5","6"],["7","8","9"],["10","11","12"],["13","14","15"],["16","17","18"]];
  for(int i=0;i<wordslist2.length;i++)
  {
    print(wordslist2.length);
    for(int j=0;j<wordslist2[i].length;j++)
    {
      print(wordslist2[i].length);
      mylis.add(wordlist[i][j]+wordslist2[i][j]);
    }
  }
  print(mylis);
}