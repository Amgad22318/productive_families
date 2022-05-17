import 'dart:convert';

import 'api_image.dart';

ApiUserFavoriteGroups groupsFromJson(String str) => ApiUserFavoriteGroups.fromJson(json.decode(str));
String groupsToJson(ApiUserFavoriteGroups data) => json.encode(data.toJson());

class ApiUserFavoriteGroups {
  ApiUserFavoriteGroups({
    int? id,
    String? title,
    ApiImage? image,}){
    _id = id;
    _title = title;
    _image = image;
  }

  ApiUserFavoriteGroups.fromJson(dynamic json) {
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