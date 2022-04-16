import 'dart:convert';

Image imageFromJson(String str) => Image.fromJson(json.decode(str));

String imageToJson(Image data) => json.encode(data.toJson());

class Image {
  // Image({
  //   this.id,
  //   this.path,
  //   this.type,
  // });

  Image.fromJson(dynamic json) {
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