import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Screentwo extends StatelessWidget {
  const Screentwo({super.key, this.value});
  final value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('screen 2'),
    );
  }
}












// Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('two'),
//             // ElevatedButton(
//             //     onPressed: () {
//             //       Navigator.of(context).push(MaterialPageRoute(
//             //         builder: (context) {
//             //           return Screenone();
//             //         },
//             //       ));
//             //     },
//             //     child: Text('go to one'))
//           ],
//         ),