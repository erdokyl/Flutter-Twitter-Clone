import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_flutter_clone/constant/color_constant.dart';
import 'package:twitter_flutter_clone/constant/text_constant.dart';
import 'package:twitter_flutter_clone/feature/home/home_page.dart';
import 'package:twitter_flutter_clone/feature/message/message_view.dart';
import 'package:twitter_flutter_clone/feature/notifications/notifications_view.dart';
import 'package:twitter_flutter_clone/feature/search/search_view.dart';

import '../../constant/padding_constant.dart';

class TwitterTabBarView extends StatefulWidget {
  const TwitterTabBarView({super.key});

  @override
  State<TwitterTabBarView> createState() => _TwitterTabBarViewState();
}

class _TwitterTabBarViewState extends State<TwitterTabBarView> {
  int currentIndex = 0;
  String _twitterPPUrl =
      'https://user-images.githubusercontent.com/72533615/191083335-53546aa4-e576-4632-a2bb-0f9b36bc1321.png';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          floatingActionButton: _floatActionButton,
          bottomNavigationBar: _botAppBar(),
          appBar: _appBar(_twitterPPUrl),
          body: _twitterTabBarViewBody(),
        ));
  }

  Column _twitterTabBarViewBody() {
    return Column(children: const [
      Expanded(
          child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
        HomePage(),
        TwitterSearchView(),
        TwitterNotificationsView(),
        TwitterMessageView()
        ],
      ))
    ]);
  }

  AppBar _appBar(String url) => AppBar(
        elevation:0,
        leading: Padding(
          padding: PaddingConstant.instance.paddingAll8,
          child: CircleAvatar(
            backgroundImage: NetworkImage(url),
          ),
        ),
        title: _appBarTitleWidget(),
      );

  Widget _appBarTitleWidget() {
    switch (currentIndex) {
      case 0: return _homeTextWidget();
      case 1: return _searchRowWidget();
      case 2: return _notificationRowWidget();
      case 3: return _messagesRowWidget();
      default: 
        return const SizedBox();
    }
  }

  Row _messagesRowWidget() {
    return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Messages", style: TextConstant.instance.textStyle),
      _rowSettingIcon()
    ],
  );
  }

  Row _notificationRowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Notifications", style: TextConstant.instance.textStyle),
        _rowSettingIcon()
      ],
    );
  }

  Row _searchRowWidget() {
    return Row(
      children: [
        Expanded(child: Container(height: 35, child: _searchWidget())),
        SizedBox(width: 20,),
        _rowSettingIcon()
      ],
    );
  }

  Text _homeTextWidget() =>Text("Home", style: TextConstant.instance.textStyle);

  Icon _rowSettingIcon() => Icon(Icons.settings,color: ColorConstant.instance.dark,);

  TextField _searchWidget() => TextField(
        decoration: InputDecoration(
            contentPadding: PaddingConstant.instance.paddingNone,
            prefixIcon: const Icon(
              Icons.search,
              color:  Colors.grey,
            ),
            hintText: "Search Twitter",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
      );

  FloatingActionButton get _floatActionButton => FloatingActionButton(
        onPressed: () {},
        child:  currentIndex ==3 ?Icon(Icons.mail): Icon(Icons.add),
      );

  BottomAppBar _botAppBar() => BottomAppBar(child: _tabbarItems());

  TabBar _tabbarItems() {
    return TabBar(
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      tabs: [
        _bottomAppBarItem(const Icon(Icons.home)),
        _bottomAppBarItem(const Icon(Icons.search)),
        _bottomAppBarItem(const Icon(CupertinoIcons.bell_fill)),
        _bottomAppBarItem(const Icon(CupertinoIcons.mail_solid))
      ],
    );
  }

  Tab _bottomAppBarItem(Widget icon) => Tab(icon: icon);
}
