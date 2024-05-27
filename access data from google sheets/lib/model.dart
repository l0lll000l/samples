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
        'https://script.googleusercontent.com/macros/echo?user_content_key=R2_O3gsEx0M3RmHRIyYzGQPXzwpxERHVWaQuJyIVtklZ1LhHQWCOf-iPwMw94i269WPrV7cqFsGdqPYOcKQpygkgQsO0veDpm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnG85V4XDV0yKLY7ku_30makKZLHLPgbEE6jU6qVJwdtzkM1c6Whli-Bo6DEX-dJ2hi9ZiS4vcjopNW0I7oiOSuxljd3AyhWQUw&lib=Mim0NEI_0MoZoAKMPD3v0q9ftfhwA5jNT'));
    if (response.statusCode == 200) {
      print(response);
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => MarioCharacter.fromjson(data)).toList();
    } else {
      throw Exception('Failed to fetch data from api');
    }
  }
}
