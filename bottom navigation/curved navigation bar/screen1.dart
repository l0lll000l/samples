import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (BuildContext context, int value, Widget? child) {
        return CurvedNavigationBar(
            animationDuration: Duration(milliseconds: 400),
            onTap: (value) {
              indexChangeNotifier.value = value;
            },
            // index: value,
            height: 50,
            items: [
              Icon(Icons.home),
              Icon(Icons.new_label),
              Icon(Icons.search),
            ]);
      },
    );
  }
}
