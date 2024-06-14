import 'package:flutter/material.dart';
import 'package:flutter_application_21/another.dart';
import 'package:flutter_application_21/local.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    listenToNotifications();
    // TODO: implement initState
    super.initState();
  }

  //------------------------------------------
  listenToNotifications() {
    print('listening to notification');
    Localnotification.onclickNotification.stream.listen((event) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => newpage(payload: event),
          ));
    });
  }

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
                      title: 'title', body: 'body', payload: 'hi');
                },
                child: Text('normal notification ')),
            ElevatedButton(
                onPressed: () {
                  print(1);
                  Localnotification.periodicNotifications(
                      title: 'title', body: 'body', payload: 'payload');
                },
                child: Text('repeat ')),
            ElevatedButton(
                onPressed: () {
                  print(1);
                  Localnotification.cancel(1);
                },
                child: Text('close ')),
            ElevatedButton(
                onPressed: () {
                  print(1);
                  Localnotification.closeAll();
                },
                child: Text('close all')),
            ElevatedButton(
                onPressed: () {
                  print(1);
                  Localnotification.showScheduledNotification(
                      title: 'title', body: 'body', payload: 'payload');
                },
                child: Text('scheduled'))
          ],
        ),
      ),
    );
  }
}
