// class Task {
//   final int status, id;
//   final String content;
//   Task({
//     required this.status,
//     required this.id,
//     required this.content,
//   });
// }
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_23/services/databaseService.dart';

class newPage extends StatefulWidget {
  const newPage({super.key});

  @override
  State<newPage> createState() => _newPageState();
}

class _newPageState extends State<newPage> {
  @override
  Widget build(BuildContext context) {
    LocalDataBase().readAllData();
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            // final data = WholeList[index];
            return Container(
              child: Text('name'),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 10);
          },
          itemCount: 15),
    );
  }
}
