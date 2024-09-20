void main()
{
  List<dynamic> corrrectword=[["न"], ["म"], ["स्", "त","े"]];
  List<dynamic> userword=[["न"], ["म"], ["स्q", "त","े"]];
  List<dynamic> boolsOfMatching=[];
  int length=corrrectword.length;
  List<String> correctWordFlat=[];
  List<String> userWordFlat=[];
  String samyukta="";
  for(int m=0;m<corrrectword.length;m++)
  {
    for(int n=0;n<corrrectword[m].length;n++)
    {
      if(corrrectword[m].length>0)
      {
        if(n<(corrrectword[m].length-1)) samyukta+=corrrectword[m][n];
        else if(n==corrrectword[m].length-1){samyukta+=corrrectword[m][n]; correctWordFlat.add(samyukta);samyukta="";}
        else print("something went wrong !");
      }
      else if(corrrectword[m].length==0) correctWordFlat.add(corrrectword[m][n]);
      else print("Something else happend !");
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
        else print("something went wrong !");
      }
      else if(userword[m].length==0) userWordFlat.add(userword[m][n]);
      else print("Something else happend !");
    }
  }
  print(correctWordFlat);
  print(userWordFlat);

  for(int l=0;l<userWordFlat.length;l++)
  {
    if(userWordFlat[l]==correctWordFlat[l]) boolsOfMatching.add("Code :: Green");
    else if(correctWordFlat.contains(userWordFlat[l])) boolsOfMatching.contains("code :: Orange");
    else if(!correctWordFlat.contains(userWordFlat[l])) boolsOfMatching.add("Code :: Gray");
    else print("Went Wrong!"); 
  }
  print(boolsOfMatching);
}
