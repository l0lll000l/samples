import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen1.dart';

class Screentwo extends StatelessWidget {
  const Screentwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('two'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('screen1');
                },
                child: Text('go to one'))
          ],
        ),
      ),
    );
  }
}
