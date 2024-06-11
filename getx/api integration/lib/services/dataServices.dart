import 'dart:convert';

import 'package:flutter_application_16/model/dataModel.dart';
import 'package:http/http.dart' as http;

class Dataservices {
  //                                                            1st get url
  var url = 'https://fakestoreapi.com/products/1';
  //                                                            2nd  create function
  Future<Datamodel?> getServices() async {
    var response = await http.get(Uri.parse(url)); //            assign response
    if (response.statusCode == 200) {
      var data = await json.decode(response.body); //            json decode
      return Datamodel.fromJson(data); //                        json to dart
    } else {
      return null;
    }
  }
}
