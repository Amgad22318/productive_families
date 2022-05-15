import 'dart:convert';
UserAddAndRemoveProductToFavoritesModel userAddAndRemoveProductToFavoritesModelFromJson(String str) => UserAddAndRemoveProductToFavoritesModel.fromJson(json.decode(str));
String userAddAndRemoveProductToFavoritesModelToJson(UserAddAndRemoveProductToFavoritesModel data) => json.encode(data.toJson());
class UserAddAndRemoveProductToFavoritesModel {
  UserAddAndRemoveProductToFavoritesModel({
      int? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  UserAddAndRemoveProductToFavoritesModel.fromJson(dynamic json) {
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