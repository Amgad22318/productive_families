import 'dart:convert';

UserRequestDriverModel requestDriverModelFromJson(String str) =>
    UserRequestDriverModel.fromJson(json.decode(str));
String requestDriverModelToJson(UserRequestDriverModel data) =>
    json.encode(data.toJson());

class UserRequestDriverModel {
  UserRequestDriverModel({
    int? status,
    String? message,
    int? orderId,
  }) {
    _status = status;
    _message = message;
    _orderId = orderId;
  }

  UserRequestDriverModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _orderId = json['order_id'];
  }
  int? _status;
  String? _message;
  int? _orderId;

  int get status => _status ?? 0;
  String get message => _message ?? "";
  int get orderId => _orderId ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['order_id'] = _orderId;
    return map;
  }
}
