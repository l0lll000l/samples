import 'package:flutter/material.dart';

class Page1 with ChangeNotifier {
  String test1 = 'Amal';
  String test2 = 'Athul';
  String test3 = 'Ajay';

  void change() {
    test1 = 'sing';
    test2 = 'annan';
    notifyListeners();
  }
}
