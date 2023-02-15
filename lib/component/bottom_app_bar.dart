
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BotAppBar extends StatelessWidget {
  const BotAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(child: _tabbarItems());
  }

  TabBar _tabbarItems() {
    return TabBar(
      onTap: (index){
        print(index);
      },
    tabs: [
      BottomAppBarItem(Icon(Icons.home)),
      BottomAppBarItem(Icon(Icons.search)),
      BottomAppBarItem(Icon(CupertinoIcons.bell_fill)),
      BottomAppBarItem(Icon(CupertinoIcons.mail_solid))
    ],
  );
  }

  Tab BottomAppBarItem(Widget icon) => Tab(icon: icon);
}
