import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_23/home.dart';
import 'package:flutter_application_23/services/databaseService.dart';

class UpdateName extends StatefulWidget {
  final id;
  const UpdateName({super.key, this.id});

  @override
  State<UpdateName> createState() => _UpdateDbState();
}

class _UpdateDbState extends State<UpdateName> {
  String? name;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  await LocalDataBase().upadateData(name: name, id: widget.id);
                  await LocalDataBase().readAllData();
                  newList = WholeList;
                  Navigator.of(context).pop();
                },
                child: Text('update'))
          ],
        ),
      ),
    );
  }
}
