class UserData {
  // String? name;
  String? phone;
  String? uId;
  UserData({this.phone, this.uId});
  UserData.fromjson(Map<String, dynamic> json) {
    phone = json['phone'];
    uId = json['uId'];
  }
  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
      'uId': uId,
    };
  }
}
