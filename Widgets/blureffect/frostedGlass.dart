import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlass extends StatelessWidget {
  const FrostedGlass(
      {super.key, required this.theWidth, required this.theHeight, this.child});
  final double theWidth;
  final double theHeight;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: theWidth,
        height: theHeight,
        child: Stack(
          children: [
            /// blur effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white.withOpacity(0.15)),
                  gradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.15),
                    Colors.white.withOpacity(0.05)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            ),
            Center(
              child: child,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:webapp/FEATURE/screens/images/frosted_glass.dart';
import 'package:webapp/Utils/Helpers/helper_functions.dart';
import 'package:webapp/Utils/Theme/customTheme/text_theme.dart';
import 'package:webapp/Utils/constants/image_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = XHelperFunctions.screenSize();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(XImages.background), fit: BoxFit.cover)),
        alignment: Alignment.center,
        child: FrostedGlass(
          theHeight: 200,
          theWidth: 200,
          child: Text('hello',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: Colors.white)),
        ),
      ),
    );
  }
}

