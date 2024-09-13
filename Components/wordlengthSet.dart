void main()
{
  sendingLengthOfWord(4);
}

void sendingLengthOfWord(given_length)
{
  Map<int,List<List<String>>> lengthOfWord=
  {
    3:[["","",""],["","",""],["","",""],["","",""],["","",""],["","",""]],
    4:[["","","",""],["","","",""],["","","",""],["","","",""],["","","",""],["","","",""]],
    5:[["","","","",""],["","","","",""],["","","","",""],["","","","",""],["","","","",""],["","","","",""]]
  };
  lengthOfWord.forEach((length,lists)
  {
    if(length==given_length)
    {
      print("$length===>$lists");
    }
  }
  );
}