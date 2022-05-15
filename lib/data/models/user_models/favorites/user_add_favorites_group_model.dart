import 'dart:convert';
UserAddFavoritesGroupModel userAddFavoritesGroupModelFromJson(String str) => UserAddFavoritesGroupModel.fromJson(json.decode(str));
String userAddFavoritesGroupModelToJson(UserAddFavoritesGroupModel data) => json.encode(data.toJson());
class UserAddFavoritesGroupModel {
  UserAddFavoritesGroupModel({
      int? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  UserAddFavoritesGroupModel.fromJson(dynamic json) {
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