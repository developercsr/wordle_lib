//This is just a test code. The same code is in the working program.
import "dart:io";
returnCorrectWordParts() async
  {
    List<String> vowels=['अ', 'आ', 'इ', 'ई', 'उ', 'ऊ','ऋ','ए','ऐ','ओ','औ', 'अं', 'अः'];
    List<String> consonants=['क', 'ख', 'ग', 'घ', 'ङ','च', 'छ', 'ज', 'झ', 'ञ','ट', 'ठ', 'ड','ढ', 'ण','त', 'थ', 'द', 'ध', 'न','प', 'फ', 'ब', 'भ', 'म','य','र', 'ल', 'व', 'श', 'ष', 'स', 'ह','क्ष', 'त्र', 'ज्ञ'];
    List<String> halfvowels=['ा', 'ि', 'ी', 'ु', 'ू', 'ृ', 'ॄ', 'े', 'ै', 'ो', 'ौ', 'ं','ः'];
    List<String> halfConsonants=['क्', 'ख्', 'ग्', 'घ्', 'ङ्','च्', 'छ्', 'ज्', 'झ्', 'ञ्','ट्', 'ठ्', 'ड्','ढ्', 'ण्','त्', 'थ्', 'द्', 'ध्', 'न्','प्', 'फ्', 'ब्', 'भ्', 'म्','य्','र्', 'ल्', 'व्', 'श्','ष्', 'स्', 'ह्','क्ष्', 'त्र्', 'ज्ञ्'];
    String correctone="अधिकारक्षेत्र";
    List<String> correctoneParts=correctone.split("");
    List<int> removeOttu=[];
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
    // print(correctoneParts);
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
        print(correctWord);
        vowellis.add(correctoneParts[i]);
        correctWord.add(vowellis);
      }
      else if(ispartisConsonant)
      {
        print(correctWord);
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
          else if(halfConsonants.contains(correctoneParts[i+1])){print("Next word started");}
          else if(halfvowels.contains(correctoneParts[i+1])){print("same word Continued");}
          else{print("something Happened");}
        }
        else if(i==correctoneParts.length-1)
        {
          correctWord.add(samyuklis);
          samyuklis=[];
        }
        else{}

      }
      else if(ispartishalfConsonant)
      {
        print(correctWord);
        samyuklis.add(correctoneParts[i]);
      }
      else if(ispartisHalfOvwel)
      {
        print(correctWord);
        samyuklis.add(correctoneParts[i]);
        correctWord.add(samyuklis);
        samyuklis=[];
      }
      else
      {
        print(correctWord);
        print("something else!");
      }
    }
    print(correctWord);
  }
void main() async
{
  // String a="""print("क्ष".split(""));
  // print("त्र".split(""));
  // print("ज्ञ".split(""));""";
  // final doubt=File("output.txt");
  // String Out1="क्ष".split("").toString();
  // String Out2="त्र".split("").toString();
  // String Out3="ज्ञ".split("").toString();
  // await doubt.writeAsString(a+"\n"+Out1+"\n"+Out2+"\n"+Out3+"\n");
  returnCorrectWordParts();
}