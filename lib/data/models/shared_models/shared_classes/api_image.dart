import 'dart:convert';
ApiImage apiImageFromJson(String str) => ApiImage.fromJson(json.decode(str));
String apiImageToJson(ApiImage data) => json.encode(data.toJson());
class ApiImage {
  ApiImage({
      int? id, 
      String? path, 
      String? type,}){
    _id = id;
    _path = path;
    _type = type;
}

  ApiImage.fromJson(dynamic json) {
    _id = json['id'];
    _path = json['path'];
    _type = json['type'];
  }
  int? _id;
  String? _path;
  String? _type;

  int get id => _id??0;
  String get path => _path??"";
  String get type => _type??"";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['path'] = _path;
    map['type'] = _type;
    return map;
  }

}