import 'dart:convert';

import 'package:productive_families/data/models/shared_models/shared_classes/api_image.dart';
UserAllFavoriteGroupsModel userAllFavoriteGroupsModelFromJson(String str) => UserAllFavoriteGroupsModel.fromJson(json.decode(str));
String userAllFavoriteGroupsModelToJson(UserAllFavoriteGroupsModel data) => json.encode(data.toJson());
class UserAllFavoriteGroupsModel {
  UserAllFavoriteGroupsModel({
      int? status, 
      String? message, 
      List<Groups>? groups,}){
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
        _groups?.add(Groups.fromJson(v));
      });
    }
  }
  int? _status;
  String? _message;
  List<Groups>? _groups;

  int get status => _status??0;
  String get message => _message??"";
  List<Groups> get groups => _groups??[];

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

Groups groupsFromJson(String str) => Groups.fromJson(json.decode(str));
String groupsToJson(Groups data) => json.encode(data.toJson());
class Groups {
  Groups({
      int? id, 
      int? userId, 
      String? title, 
      ApiImage? icon,}){
    _id = id;
    _userId = userId;
    _title = title;
    _icon = icon;
}

  Groups.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _title = json['title'];
    _icon = json['icon'] != null ? ApiImage.fromJson(json['icon']) : null;
  }
  int? _id;
  int? _userId;
  String? _title;
  ApiImage? _icon;

  int get id => _id??0;
  int get userId => _userId??0;
  String get title => _title??"";
  ApiImage get icon => _icon??ApiImage();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['title'] = _title;
    if (_icon != null) {
      map['icon'] = _icon?.toJson();
    }
    return map;
  }

}

