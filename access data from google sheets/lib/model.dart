import 'dart:convert';
import 'package:http/http.dart ' as http;

class MarioCharacter {
  final String name;
  final String purpose;
  final bool isEnemy;
  MarioCharacter(
      {required this.name, required this.purpose, required this.isEnemy});
  factory MarioCharacter.fromjson(Map<String, dynamic> json) {
    return MarioCharacter(
      name: json['Name'],
      purpose: json['Purpose'],
      isEnemy: json['Enemy'],
    );
  }

  static Future<List<MarioCharacter>> fetchAll() async {
    final response = await http.get(Uri.parse(
        'add url'));                    //--------------------------------------------------------------add url here
    if (response.statusCode == 200) {
      print(response);
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => MarioCharacter.fromjson(data)).toList();
    } else {
      throw Exception('Failed to fetch data from api');
    }
  }
}
