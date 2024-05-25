import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (BuildContext context, int value, Widget? child) {
        return GNav(
            onTabChange: (value) {
              indexChangeNotifier.value = value;
            },
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.new_label,
                text: 'new',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
            ]);
      },
    );
  }
}

  //  onTap: (value) {
  //             indexChangeNotifier.value = value;
  //           },