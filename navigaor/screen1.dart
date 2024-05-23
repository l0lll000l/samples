import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen2.dart';

class Screenone extends StatelessWidget {
  const Screenone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('one'),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return Screentwo();
                  },
                ));
              },
              child: Text('go to screen2'))
        ],
      ),
    );
  }
}
