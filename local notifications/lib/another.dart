import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class newpage extends StatelessWidget {
  final payload;
  const newpage({super.key, this.payload});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(payload!)),
    );
  }
}
