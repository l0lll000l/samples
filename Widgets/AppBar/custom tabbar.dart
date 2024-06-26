import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/device/device_utility.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar(
      {super.key,
      required this.tabs,
      required this.isScrollable,
      required this.labelColor,
      required this.indicatorColor});
  final List<Widget> tabs;
  final bool isScrollable;
  final Color labelColor, indicatorColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TabBar(
          labelColor: labelColor,
          indicatorColor: indicatorColor,
          isScrollable: isScrollable,
          tabs: tabs),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
