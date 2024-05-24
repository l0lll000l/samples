import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_application_1/screen2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screenone extends StatelessWidget {
  Screenone({super.key});
  final TextEditingController _textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    getSavedData(context);
    return Scaffold(
        body: Column(
      children: [
        TextFormField(
          controller: _textcontroller,
        ),
        ElevatedButton(
            onPressed: () {
              saveDataToStorage();
            },
            child: Text('save value')),
      ],
    ));
  }

  Future<void> saveDataToStorage() async {
    print(_textcontroller.text);
    final sharedpref = await SharedPreferences.getInstance();
    await sharedpref.setString('saved_value', _textcontroller.text);
    final share = sharedpref.getString('saved_value');
  }
}

//use this for splash screen
Future<void> getSavedData(BuildContext context) async {
  final sharedprefs = await SharedPreferences.getInstance();
  final savedValue = sharedprefs.getString('saved_value');
  if (savedValue != null) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return Screentwo(
          value: savedValue,
        );
      },
    ));
  }
}
// //
