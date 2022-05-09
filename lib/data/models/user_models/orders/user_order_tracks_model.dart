import 'dart:convert';
UserOrderTracksModel userOrderTracksModelFromJson(String str) => UserOrderTracksModel.fromJson(json.decode(str));
String userOrderTracksModelToJson(UserOrderTracksModel data) => json.encode(data.toJson());
class UserOrderTracksModel {
  UserOrderTracksModel({
      int? status, 
      String? message,
    num? deliveryTime,
      List<Tracks>? tracks,}){
    _status = status;
    _message = message;
    _deliveryTime = deliveryTime;
    _tracks = tracks;
}

  UserOrderTracksModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _deliveryTime = json['deliveryTime'];
    if (json['tracks'] != null) {
      _tracks = [];
      json['tracks'].forEach((v) {
        _tracks?.add(Tracks.fromJson(v));
      });
    }
  }
  int? _status;
  String? _message;
  num? _deliveryTime;
  List<Tracks>? _tracks;

  int get status => _status??0;
  String get message => _message??"";
  num get deliveryTime => _deliveryTime??0;
  List<Tracks> get tracks => _tracks??[];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['deliveryTime'] = _deliveryTime;
    if (_tracks != null) {
      map['tracks'] = _tracks?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Tracks tracksFromJson(String str) => Tracks.fromJson(json.decode(str));
String tracksToJson(Tracks data) => json.encode(data.toJson());
class Tracks {
  Tracks({
      int? id, 
      String? status, 
      String? statusString, 
      String? time,
      bool? check,
  }){
    _id = id;
    _status = status;
    _statusString = statusString;
    _time = time;
    _check = check;
}

  Tracks.fromJson(dynamic json) {
    _id = json['id'];
    _status = json['status'];
    _statusString = json['status_string'];
    _time = json['time'];
    _check = json['check'];
  }
  int? _id;
  String? _status;
  String? _statusString;
  String? _time;
  bool? _check;

  int get id => _id??0;
  String get status => _status??"";
  String get statusString => _statusString??"";
  String get time => _time??"";
  bool get check => _check??false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['status'] = _status;
    map['status_string'] = _statusString;
    map['time'] = _time;
    map['check'] = _check;
    return map;
  }

}