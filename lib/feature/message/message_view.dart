import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_flutter_clone/constant/color_constant.dart';
import 'package:twitter_flutter_clone/constant/padding_constant.dart';
import 'package:twitter_flutter_clone/constant/text_constant.dart';
import 'package:twitter_flutter_clone/model/message_card_model.dart';

class TwitterMessageView extends StatefulWidget {
  const TwitterMessageView({super.key});

  @override
  State<TwitterMessageView> createState() => _TwitterMessageViewState();
}

class _TwitterMessageViewState extends State<TwitterMessageView> {
  final ScrollController controller = ScrollController();
  String _twitterPPUrl =
      'https://user-images.githubusercontent.com/72533615/191083335-53546aa4-e576-4632-a2bb-0f9b36bc1321.png';

  MessageCard messageCard = MessageCard(
      userImage: "",
      userID: "@erdokyl",
      userName: "Erdoğan",
      date: ".Feb 15",
      messageText: "Sıkıntılı bir durum ama çalışmana engel değil.");

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
          _messageCard(context),
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
            shadowColor: Colors.transparent,
            margin: PaddingConstant.instance.marginBottom20,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Padding(
                padding: PaddingConstant.instance.paddingSymmetric10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _messageViewRowWrap(),
                  ],
                )),
          );
        });
  }

  Expanded _messageViewRowWrap() {
    return Expanded(
      child: Padding(
        padding: PaddingConstant.instance.paddingLeft8,
        child: Wrap(direction: Axis.horizontal, spacing: 10, children: [
          CircleAvatar(
            backgroundImage: NetworkImage(_twitterPPUrl),
          ),
          Wrap(
            direction: Axis.vertical,
            spacing: 6,
            children: [
              Wrap(
                spacing: 3,
                children: [
                  Text(messageCard.userName!,style: TextConstant.instance.text14Bold,),
                  Text(messageCard.userID!,style: TextConstant.instance.text14Grey,),
                  Text(messageCard.date!,style: TextConstant.instance.text14Grey,)
                ],
              ),
              Container(
                width: 300,
                child: Text(messageCard.messageText!,style: TextConstant.instance.text14Grey,overflow: TextOverflow.ellipsis,))
            ],
          ),
        ]),
      ),
    );
  }

  Card _messageCard(BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      shadowColor: Colors.transparent,
      margin: PaddingConstant.instance.paddingNone,
      child: Padding(
        padding: PaddingConstant.instance.paddingSymmetric10,
        child: Container(
            margin: PaddingConstant.instance.marginBottom20,
            alignment: Alignment.center,
            height: 50,
            child: _searchWidget()),
      ),
    );
  }

  TextField _searchWidget() => TextField(
        decoration: InputDecoration(
            contentPadding: PaddingConstant.instance.paddingNone,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            hintText: "Search Direct Messages",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
      );
}
