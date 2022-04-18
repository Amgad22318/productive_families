import 'dart:convert';

ApiAddress addressFromJson(String str) => ApiAddress.fromJson(json.decode(str));
String addressToJson(ApiAddress data) => json.encode(data.toJson());
class ApiAddress {
  // Address({
  //     this.id,
  //     this.address,
  //     this.lon,
  //     this.lat,});

  ApiAddress.fromJson(dynamic json) {
    id = json['id']??0;
    address = json['address']??'';
    lon = json['lon']??0;
    lat = json['lat']??0;
  }
  late int id;
  late String address;
  late num lon;
  late num lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['address'] = address;
    map['lon'] = lon;
    map['lat'] = lat;
    return map;
  }

}