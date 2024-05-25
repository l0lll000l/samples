import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/new.dart';
import 'package:flutter_application_1/screen1.dart';
import 'package:flutter_application_1/search.dart';

class Screen2 extends StatelessWidget {
  Screen2({super.key});
  final _pages = [Home(), New(), Search()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (BuildContext context, int value, Widget? child) {
          return _pages[value];
        },
      ),
      bottomNavigationBar: Screen1(),
    );
  }
}
