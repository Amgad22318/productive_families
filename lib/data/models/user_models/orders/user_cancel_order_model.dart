import 'dart:convert';
UserCancelOrderModel userCancelOrderModelFromJson(String str) => UserCancelOrderModel.fromJson(json.decode(str));
String userCancelOrderModelToJson(UserCancelOrderModel data) => json.encode(data.toJson());
class UserCancelOrderModel {
  UserCancelOrderModel({
      int? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  UserCancelOrderModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  int? _status;
  String? _message;

  int get status => _status??0;
  String get message => _message??"";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}