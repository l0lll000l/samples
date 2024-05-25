import 'package:flutter/material.dart';
import 'package:netflix/presentation/downloads/screendownloads.dart';
import 'package:netflix/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/mainPage/widgets/bottom_navigation.dart';
import 'package:netflix/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix/presentation/search/screen_search.dart';

class ScreeenMainPage extends StatelessWidget {
  ScreeenMainPage({super.key});
  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}
