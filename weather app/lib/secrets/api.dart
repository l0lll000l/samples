import 'package:flutter_application_5/secrets/secrets.dart';

class ApiEndPoints {
  final String baseurl = 'https://api.openweathermap.org/data/2.5/weather?q=';
  final String city = 'dubai';
  final String afterCity = '&appid=';
  // final String lanlangEndPoints = '';
  final unit = '&units=metric';
  static const celsius = '$kbaseurl$cityname$kafterCity$apiKey$kunit';
}

//https://api.openweathermap.org/data/2.5/weather?q=dubai&appid=abdeca699ffc82832447bc1a0c2e64ea&units=metric
const kbaseurl = 'https://api.openweathermap.org/data/2.5/weather?q=';
const cityname = 'dubai';
const kafterCity = '&appid=';
const kunit = '&units=metric';
