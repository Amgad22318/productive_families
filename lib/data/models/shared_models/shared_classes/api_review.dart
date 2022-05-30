import 'dart:convert';

import 'api_image.dart';

ApiReview groupsFromJson(String str) => ApiReview.fromJson(json.decode(str));
String groupsToJson(ApiReview data) => json.encode(data.toJson());

class ApiReview {
  ApiReview({
    int? id,
    String? userName,
    ApiImage? userImage,
    int? rate,
    String? comment,
    ApiImage? image,
  }) {
    _id = id;
    _userName = userName;
    _userImage = userImage;
    _rate = rate;
    _comment = comment;
    _image = image;
  }

  ApiReview.fromJson(dynamic json) {
    _id = json['id'];
    _userName = json['user_name'];
    _userImage = json['user_image'] != null
        ? ApiImage.fromJson(json['user_image'])
        : null;
    _rate = json['rate'];
    _comment = json['comment'];
    _image = json['image'] != null ? ApiImage.fromJson(json['image']) : null;
  }
  int? _id;
  String? _userName;
  ApiImage? _userImage;
  int? _rate;
  String? _comment;
  ApiImage? _image;

  int get id => _id ?? 0;
  String get userName => _userName ?? "";
  ApiImage get userImage => _userImage ?? ApiImage();
  int get rate => _rate ?? 0;
  String get comment => _comment ?? "";
  ApiImage get reviewImage => _image ?? ApiImage();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_name'] = _userName;
    if (_userImage != null) {
      map['user_image'] = _userImage?.toJson();
    }
    map['rate'] = _rate;
    map['comment'] = _comment;
    if (_image != null) {
      map['image'] = _image?.toJson();
    }
    return map;
  }
}
