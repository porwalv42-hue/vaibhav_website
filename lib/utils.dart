import "package:flutter/services.dart";
import "dart:convert";

Future<List<Map<String, String>>> loadDataFromJson(String fileName) async {
  final jsonString = await rootBundle.loadString(fileName);
  final List<dynamic> jsonData = json.decode(jsonString);
  print('Loaded data: $jsonData');
  return jsonData.map((item) => Map<String, String>.from(item as Map)).toList();
}

Future<List> loadDataFromJsonExperience(String fileName) async {
  final jsonString = await rootBundle.loadString(fileName);
  final List<dynamic> jsonData = json.decode(jsonString);
  print('Loaded data: $jsonData');
  return jsonData;
}