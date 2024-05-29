import 'package:flutter/material.dart';
import 'package:flutter_application_2/sheets_api.dart';

import 'package:flutter_application_2/user_form.dart';

final idcontroller = TextEditingController();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent,
            centerTitle: true,
            title: const Text('google sheet api')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              UserForm(
                onSavedUser: (user) async {
                  final id = await UserSheetApi.getRowCount() + 1;
                  final newUser = user.copy(id: id);
                  await UserSheetApi.insert([newUser.toJson()]);
                },
              ),
            ],
          ),
        ));
  }
}
