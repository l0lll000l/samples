import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_5/model/weather_response_model.dart';
import 'package:flutter_application_5/secrets/api.dart';
import 'package:flutter_application_5/secrets/secrets.dart';
import 'package:http/http.dart' as http;

class WeatherserviceProvider extends ChangeNotifier {
  //-----------------------------------------------
  WeatherModel? _weather;
  WeatherModel? get weather => _weather;
  //-----------------------------------------------
  bool _isloading = false;
  bool get isLoading => _isloading;
  //-----------------------------------------------
  String _error = '';
  String get Error => _error;
  //-----------------------------------------------

  Future<void> fetchWetherDataByCity(String city) async {
    _isloading = true;
    _error = '';
    try {
      final apiUrl =
          '${ApiEndPoints().baseurl}$city${ApiEndPoints().afterCity}$apiKey${ApiEndPoints().unit}';

      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // print('something');
        print(response.body);
        final newWeather = WeatherModel.fromJson(data);
        if (newWeather != null) {
          _weather = newWeather;
        }
        // print('something');
        // print(_weather.main!.temp);

        notifyListeners();
      } else {
        _error = 'failed to load data';
      }
    } catch (e) {
      _error = 'error ocured $e';
    } finally {
      _isloading = false;
      notifyListeners();
    }
  }
}
