import 'dart:convert';

ApiImage imageFromJson(String str) => ApiImage.fromJson(json.decode(str));

String imageToJson(ApiImage data) => json.encode(data.toJson());

class ApiImage {
  ApiImage({
    this.id,
    this.path,
    this.type,
  });

  ApiImage.fromJson(dynamic json) {
    id = json['id'] ?? 0;
    path = json['path'] ?? '';
    type = json['type'] ?? '';
  }

  int? id;
  String? path;
  String? type;

  // Image copyWith({
  //   dynamic id,
  //   dynamic path,
  //   dynamic type,
  // }) =>
  //     Image(
  //       id: id ?? this.id,
  //       path: path ?? this.path,
  //       type: type ?? this.type,
  //     );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['path'] = path;
    map['type'] = type;
    return map;
  }
}