import 'package:flutter/material.dart';

class Page1 with ChangeNotifier {
  String test1 = 'Amal';
  String test2 = 'Athul';
  String test3 = 'Ajay';

  void change(String val) {
    test1 = val;
    test2 = 'annu';
    notifyListeners();
  }

  Widget widget() {
    return Container(
      height: 100,
      decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
    );
  }
}
