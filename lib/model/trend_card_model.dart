class TrendCard {
  String? country;
  String? hashtag;
  String? tweetCount;

  TrendCard({this.country, this.hashtag, this.tweetCount});

  TrendCard.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    hashtag = json['hashtag'];
    tweetCount = json['tweetCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['hashtag'] = this.hashtag;
    data['tweetCount'] = this.tweetCount;
    return data;
  }
}