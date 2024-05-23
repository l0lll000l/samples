import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen1.dart';

class Screentwo extends StatelessWidget {
  const Screentwo({super.key});

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
                    return Screenone();
                  },
                ));
              },
              child: Text('go to one'))
        ],
      ),
    );
  }
}
