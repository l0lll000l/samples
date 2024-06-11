import 'package:flutter/material.dart';
import 'package:newchatapp/auth/auth.dart';
import 'package:newchatapp/home.dart';
import 'package:newchatapp/ligin_register.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Home();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
