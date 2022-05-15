import 'dart:convert';
import 'package:productive_families/data/models/shared_models/shared_classes/api_image.dart';
UserFavoriteGroupsSearchModel userFavoriteGroupsSearchModelFromJson(String str) => UserFavoriteGroupsSearchModel.fromJson(json.decode(str));
String userFavoriteGroupsSearchModelToJson(UserFavoriteGroupsSearchModel data) => json.encode(data.toJson());
class UserFavoriteGroupsSearchModel {
  UserFavoriteGroupsSearchModel({
      int? status, 
      String? message, 
      List<Groups>? groups,}){
    _status = status;
    _message = message;
    _groups = groups;
}

  UserFavoriteGroupsSearchModel.fromJson(dynamic json) {
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
      String? title, 
      ApiImage? image,}){
    _id = id;
    _title = title;
    _image = image;
}

  Groups.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _image = json['image'] != null ? ApiImage.fromJson(json['image']) : null;
  }
  int? _id;
  String? _title;
  ApiImage? _image;

  int get id => _id??0;
  String get title => _title??"";
  ApiImage get image => _image??ApiImage();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    if (_image != null) {
      map['image'] = _image?.toJson();
    }
    return map;
  }
}

