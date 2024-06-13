import 'package:flutter/material.dart';
import 'package:flutter_application_21/local.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  print(1);
                  Localnotification.ShowSimpleNotification(
                      title: 'title', body: 'body', payload: 'payload');
                },
                child: Icon(Icons.notification_add))
          ],
        ),
      ),
    );
  }
}
