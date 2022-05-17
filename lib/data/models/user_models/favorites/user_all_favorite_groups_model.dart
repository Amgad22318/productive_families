import 'dart:convert';


import '../../shared_models/shared_classes/api_user__favorite_group.dart';
UserAllFavoriteGroupsModel userAllFavoriteGroupsModelFromJson(String str) => UserAllFavoriteGroupsModel.fromJson(json.decode(str));
String userAllFavoriteGroupsModelToJson(UserAllFavoriteGroupsModel data) => json.encode(data.toJson());
class UserAllFavoriteGroupsModel {
  UserAllFavoriteGroupsModel({
      int? status, 
      String? message, 
      List<ApiUserFavoriteGroups>? groups,}){
    _status = status;
    _message = message;
    _groups = groups;
}

  UserAllFavoriteGroupsModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['groups'] != null) {
      _groups = [];
      json['groups'].forEach((v) {
        _groups?.add(ApiUserFavoriteGroups.fromJson(v));
      });
    }
  }
  int? _status;
  String? _message;
  List<ApiUserFavoriteGroups>? _groups;

  set setGroups(List<ApiUserFavoriteGroups> value) {
    _groups = value;
  }

  int get status => _status??0;
  String get message => _message??"";
  List<ApiUserFavoriteGroups> get groups => _groups??[];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_groups != null) {
      map['groups'] = _groups?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}



