import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
Future<void> removeData(String key) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(key);
}
Future<List<List<String>>> getData(String key) async {
  final prefs = await SharedPreferences.getInstance();
  String? jsonString=prefs.getString(key);
  if (jsonString != null) {
    try {
      List<dynamic> jsonList = jsonDecode(jsonString);
      List<List<String>> listOfWords = jsonList.map((dynamic item) {
        if (item is List<String>) {
          return List<String>.from(item.map((subItem) => subItem.toString()));
        } else {
          throw FormatException('Expected a List<dynamic>');
        }
      }).toList();

      return listOfWords;
    } catch (e) {
      print('Error decoding JSON: $e');
      return [];
    }
  } else {
    return [];
}
}
Future<void> saveData(String key,List<List<String>> listOfWords) async {
  final prefs = await SharedPreferences.getInstance();
  String jsonString=jsonEncode(listOfWords);
  await prefs.setString(key, jsonString);
}
void main()
{

}