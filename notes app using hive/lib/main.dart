import 'dart:async';

import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:nine/home.dart';
import 'package:nine/model/datamodel.dart';

Future<void> main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(contactModelAdapter().typeId)) {
    Hive.registerAdapter(contactModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: screenHome(),
    );
  }
}
