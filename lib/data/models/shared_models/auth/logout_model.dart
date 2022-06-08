import 'dart:convert';
LogoutModel logoutModelFromJson(String str) => LogoutModel.fromJson(json.decode(str));
String logoutModelToJson(LogoutModel data) => json.encode(data.toJson());
class LogoutModel {
  LogoutModel({
      int? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  LogoutModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  int? _status;
  String? _message;

  int get status => _status ?? 0;
  String get message => _message ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}