// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_flutter_clone/constant/color_constant.dart';
import 'package:twitter_flutter_clone/constant/icon_constant.dart';
import 'package:twitter_flutter_clone/constant/text_constant.dart';

import '../../constant/padding_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ScrollController controller =ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String _twitterPPUrl =
      'https://user-images.githubusercontent.com/72533615/191083335-53546aa4-e576-4632-a2bb-0f9b36bc1321.png';
  String _lorem = "It ain't much , but it's honest work";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: _listViewBuilder,
      ),
    );
  }

  ListView get _listViewBuilder {
    
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        controller: controller,
        itemCount: 1,
        itemBuilder: ((context, index) {
          return _listViewCard;
        }));
  }

  Card get _listViewCard => Card(
        shadowColor: Colors.transparent,
        margin: PaddingConstant.instance.paddingNone,
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(_twitterPPUrl),
          ),
          title: listViewCardTitle(),
        ),
      );

  Wrap listViewCardTitle() {
    return Wrap(
      children: [
        Wrap(
          spacing: 3,
          children: [
            Text(
              'Erdoğan',
              style: TextConstant.instance.text16Bold,
            ),
            Text(
              '@erdokyl',
              style: TextConstant.instance.text16Opacity,
            )
          ],
        ),
        SizedBox(height: 20,),
        Text(_lorem),
        Padding(
          padding: PaddingConstant.instance.paddingTop8,
          child: tweetButtonRow(),
        )
      ],
    );
  }

  Row tweetButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        tweetButton(Icon(
          Icons.message,
          size: IconConstant.instance.iconSizeM,
        )),
        tweetButton(Icon(
          Icons.repeat_rounded,
          size: IconConstant.instance.iconSizeM,
        )),
        tweetButton(Icon(
          CupertinoIcons.heart,
          size: IconConstant.instance.iconSizeM,
        )),
      ],
    );
  }

  InkWell tweetButton(Widget icon) => InkWell(
        child: tweetButtonLabel(icon),
        onTap: () {},
      );

  Wrap tweetButtonLabel(Widget icon) =>
      Wrap(spacing: 5, children: [icon, Text('1')]);

  FloatingActionButton get _floatActionButton => FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      );

  AppBar _appBar(String url) => AppBar(
        leading: Padding(
          padding: PaddingConstant.instance.paddingAll8,
          child: CircleAvatar(
            backgroundImage: NetworkImage(url),
          ),
        ),
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
      );
}
