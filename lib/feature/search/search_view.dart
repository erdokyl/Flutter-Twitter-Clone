import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_flutter_clone/constant/padding_constant.dart';
import 'package:twitter_flutter_clone/constant/text_constant.dart';
import 'package:twitter_flutter_clone/model/trend_card_model.dart';


class TwitterSearchView extends StatefulWidget {
  const TwitterSearchView({super.key});

  @override
  State<TwitterSearchView> createState() => _TwitterSearchViewState();
}

class _TwitterSearchViewState extends State<TwitterSearchView> {
  final ScrollController controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  TrendCard trendCard = TrendCard(
      country: "Trending in World",
      hashtag: "#hashtag",
      tweetCount: "326k Tweets");
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
          _trendCard(context),
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
            shadowColor: Colors.transparent,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Padding(
                padding: PaddingConstant.instance.paddingSymmetric10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _searchViewRowWrap(),
                    Icon(Icons.more_horiz),
                  ],
                )),
          );
        });
  }

  Expanded _searchViewRowWrap() {
    return Expanded(
      child: Wrap(direction: Axis.vertical, spacing: 6, children: [
        Text(
          trendCard.country!,
          style: TextConstant.instance.text12Grey,
        ),
        Text(
          trendCard.hashtag!,
          style: TextConstant.instance.text16Bold,
        ),
        Text(trendCard.tweetCount!, style: TextConstant.instance.text12Grey),
      ]),
    );
  }

  Card _trendCard(BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      shadowColor: Colors.transparent,
      margin: PaddingConstant.instance.paddingNone,
      child: Container(
        margin: PaddingConstant.instance.marginBottom10,
        padding: PaddingConstant.instance.paddingLeft10,
        alignment: Alignment.centerLeft,
        height: 50,
        child: Text(
          "Trends For You",
          style: TextConstant.instance.text24Bold,
        ),
      ),
    );
  }
}
