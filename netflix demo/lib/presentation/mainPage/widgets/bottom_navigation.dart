import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) {
        return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: newIndex,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_fire_department), label: 'new&hot'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.fast_forward_outlined), label: 'fast laugh'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download), label: 'downloads'),
            ]);
      },
    );
  }
}
