import 'dart:async';

import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:nine/model/datamodel.dart';

ValueNotifier<List<contactModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudents(contactModel value) async {
  final studentDB = await Hive.openBox<contactModel>('student_db');
  final _id = await studentDB.add(value);
  value.id = _id;
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<contactModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  print(studentListNotifier.value);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async {
  final studentDB = await Hive.openBox<contactModel>('student_db');
  await studentDB.delete(id);
  getAllStudents();
}
