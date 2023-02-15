import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_flutter_clone/constant/color_constant.dart';
import 'package:twitter_flutter_clone/constant/padding_constant.dart';
import 'package:twitter_flutter_clone/constant/text_constant.dart';
import 'package:twitter_flutter_clone/model/notification_card_model.dart';

class TwitterNotificationsView extends StatefulWidget {
  const TwitterNotificationsView({super.key});

  @override
  State<TwitterNotificationsView> createState() =>
      _TwitterNotificationsViewState();
}

class _TwitterNotificationsViewState extends State<TwitterNotificationsView> {
  final ScrollController controller = ScrollController();
  String _twitterPPUrl =
      'https://user-images.githubusercontent.com/72533615/191083335-53546aa4-e576-4632-a2bb-0f9b36bc1321.png';
  NotificationCard nCard = NotificationCard(
      nIcon: "", nType: "followed", userImage: "", userName: "Erdoğan");

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(Duration(seconds: 1));
      },
      child: ListView(
        physics: BouncingScrollPhysics(),
        controller: controller,
        children: [
          _notificationCard(context),
          _listViewBuilder(context),
        ],
      ),
    );
  }

  ListView _listViewBuilder(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 1,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Card(
            margin: PaddingConstant.instance.marginBottom20,
            elevation:0,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Padding(
                padding: PaddingConstant.instance.paddingSymmetric10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _notificationViewRowWrap(),
                    Icon(Icons.more_horiz),
                  ],
                )),
          );
        });
  }

  Expanded _notificationViewRowWrap() {
    return Expanded(
      child: Padding(
        padding: PaddingConstant.instance.paddingLeft16,
        child: Wrap(direction: Axis.vertical, spacing: 10, children: [
          Wrap(
            spacing: 10,
            children: [
              Icon(
                CupertinoIcons.person_fill,
                color: ColorConstant.instance.darkBlue,
              ),
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(_twitterPPUrl),
              )
            ],
          ),
          Padding(
            padding: PaddingConstant.instance.paddingLeft35 ,
            child: Wrap(
              children: [Text(nCard.userName!,style: TextConstant.instance.text14Bold,),Text(" is ${nCard.nType!} you")],
              ),
            ),
        ]),
      ),
    );
  }

  Card _notificationCard(BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      elevation:0,
      margin: PaddingConstant.instance.paddingNone,
      child: Container(
        margin: PaddingConstant.instance.marginBottom10,
        alignment: Alignment.center,
        height: 50,
        child: Text(
          "All",
          style: TextConstant.instance.text20Bold,
        ),
      ),
    );
  }
}
