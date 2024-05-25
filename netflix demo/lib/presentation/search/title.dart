import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class SearchWidgetTitle extends StatelessWidget {
  final String title;
  const SearchWidgetTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: kwhite, fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
