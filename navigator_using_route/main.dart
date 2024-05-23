import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen1.dart';
import 'package:flutter_application_1/screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const Screenone(),
      routes: {
        'screen1': (context) {
          return Screenone();
        },
        'screen2': (context) {
          return Screentwo();
        }
      },
    );
  }
}
