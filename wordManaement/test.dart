void main()
{
  String test="स्मृति";
  List<String> charactersList = test.runes.map((rune) => String.fromCharCode(rune)).toList();
  for (var character in charactersList) {
    print(character);
  }
  print(charactersList.length);
}