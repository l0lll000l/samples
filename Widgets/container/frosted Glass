import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlass extends StatelessWidget {
  const FrostedGlass(
      {super.key,
      this.theWidth = 100,
      this.theHeight = 100,
      this.child,
      this.ontap});
  final double? theWidth;
  final double? theHeight;
  final Widget? child;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: GestureDetector(
        onTap: ontap,
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
      ),
    );
  }
}
