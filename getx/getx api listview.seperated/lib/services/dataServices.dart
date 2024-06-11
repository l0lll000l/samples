import 'dart:convert';

import 'package:flutter_application_16/model/dataModel.dart';
import 'package:http/http.dart' as http;

class DataServices {
  var url =
      'https://api.themoviedb.org/3//discover/movie?api_key=173fe9a9cf19bcbf89e07d0e8a31733a';

  Future<DataModel?> getServices() async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = await json.decode(response.body);

      return DataModel.fromJson(data);
    } else {
      return null;
    }
  }
}
