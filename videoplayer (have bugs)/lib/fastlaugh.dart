import 'package:fake/videoList.dart';
import 'package:flutter/material.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(10, (index) {
                  return VideoListItem(
                    index: index,
                  );
                }))));
  }
}
