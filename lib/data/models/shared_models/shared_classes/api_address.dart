import 'dart:convert';

ApiAddress addressFromJson(String str) => ApiAddress.fromJson(json.decode(str));
String addressToJson(ApiAddress data) => json.encode(data.toJson());
class ApiAddress {
  ApiAddress({
    int? id,
    String? address,
    num? lon,
    num? lat,}){
    _id = id;
    _address = address;
    _lon = lon;
    _lat = lat;
  }

  ApiAddress.fromJson(dynamic json) {
    _id = json['id'];
    _address = json['address'];
    _lon = json['lon'];
    _lat = json['lat'];
  }
  int? _id;
  String? _address;
  num? _lon;
  num? _lat;

  int get id => _id??0;
  String get address => _address??"";
  num get lon => _lon??0;
  num get lat => _lat??0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['address'] = _address;
    map['lon'] = _lon;
    map['lat'] = _lat;
    return map;
  }

}