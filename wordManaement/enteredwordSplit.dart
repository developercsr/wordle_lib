//This is a test Program, This already added to the main program 
void main()
{
  List<dynamic> userword=["न", "म", "स्ते"];
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
    print(letterSplit);
    userwordParts.add(letterSplit);
  }
  print(userwordParts);
}