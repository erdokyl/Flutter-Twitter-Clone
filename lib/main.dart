import 'package:flutter/material.dart';
import 'package:twitter_flutter_clone/constant/color_constant.dart';
import 'package:twitter_flutter_clone/feature/home/tab_bar_view.dart';

import 'constant/icon_constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: Colors.white,
            tabBarTheme: TabBarTheme(
                indicator: UnderlineTabIndicator(),
                labelColor: ColorConstant.instance.buttonSelectedIcon,
                unselectedLabelColor:
                    ColorConstant.instance.buttonUnselectedIcon),
            appBarTheme: AppBarTheme(
                shadowColor: Colors.transparent,
                color: Theme.of(context).scaffoldBackgroundColor),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedIconTheme:
                    IconConstant.instance.navBarButtonSelectedIcon,
                unselectedIconTheme:
                    IconConstant.instance.navBarButtonUnselectedIcon)),
        title: 'Material App',
        home: TwitterTabBarView());
  }
}
