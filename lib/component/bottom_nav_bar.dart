import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 24,
        items: [
          BottomNavBarItem(Icon(Icons.home)),
          BottomNavBarItem(Icon(Icons.search)),
          BottomNavBarItem(Icon(CupertinoIcons.bell_fill)),
          BottomNavBarItem(Icon(CupertinoIcons.mail_solid)),
        ]);
    ;
  }

  BottomNavigationBarItem BottomNavBarItem(Widget itemIcon) =>
      BottomNavigationBarItem(label: '', icon: itemIcon);
}

