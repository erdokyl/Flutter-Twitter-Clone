class MessageCard {
  String? userImage;
  String? userName;
  String? userID;
  String? date;
  String? messageText;

  MessageCard(
      {this.userImage,
      this.userName,
      this.userID,
      this.date,
      this.messageText});

  MessageCard.fromJson(Map<String, dynamic> json) {
    userImage = json['userImage'];
    userName = json['userName'];
    userID = json['userID'];
    date = json['date'];
    messageText = json['messageText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userImage'] = this.userImage;
    data['userName'] = this.userName;
    data['userID'] = this.userID;
    data['date'] = this.date;
    data['messageText'] = this.messageText;
    return data;
  }
}