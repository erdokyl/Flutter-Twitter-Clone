class NotificationCard {
  String? nIcon;
  String? nType;
  String? userImage;
  String? userName;

  NotificationCard({this.nIcon, this.nType, this.userImage, this.userName});

  NotificationCard.fromJson(Map<String, dynamic> json) {
    nIcon = json['nIcon'];
    nType = json['nType'];
    userImage = json['userImage'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nIcon'] = this.nIcon;
    data['nType'] = this.nType;
    data['userImage'] = this.userImage;
    data['userName'] = this.userName;
    return data;
  }
}