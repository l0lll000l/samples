import 'package:flutter/material.dart';

import 'package:netflix/core/constants.dart';

class WidgetAppBar extends StatelessWidget {
  const WidgetAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(Icons.cast),
        kwidth,
        Container(
          color: Colors.blue,
          width: 30,
          height: 30,
        ),
        kwidth
      ],
    );
  }
}
