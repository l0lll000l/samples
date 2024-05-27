import 'package:flutter/material.dart';
import 'package:nine/addname.dart';
import 'package:nine/listname.dart';

class screenHome extends StatelessWidget {
  const screenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(child: addStudent()),
          const Expanded(child: listStudent())
        ],
      )),
    );
  }
}
