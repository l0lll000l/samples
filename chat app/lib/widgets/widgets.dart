import 'package:chatapplasttry/shared/constant.dart';
import 'package:flutter/material.dart';

textformfieldDecoration({labelText, icon}) {
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.blue)),
    enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(width: 2, color: korange)),
    border: const OutlineInputBorder(),
    labelText: labelText,
    labelStyle: const TextStyle(color: Colors.black),
    hintStyle: const TextStyle(color: Colors.black),
    prefixIcon: Icon(
      icon,
      color: Colors.black,
    ),
  );
}

//---------------------------------------------------------snack bar
void showSnackBar(context, {message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: korange,
      action: SnackBarAction(
        label: 'ok',
        textColor: Colors.white,
        onPressed: () {},
      ),
      duration: Duration(seconds: 2),
      content: Text(
        message,
        style: TextStyle(fontSize: 14),
      )));
}
