import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainTitle extends StatelessWidget {
  final String title;
  const MainTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: kwhite, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
