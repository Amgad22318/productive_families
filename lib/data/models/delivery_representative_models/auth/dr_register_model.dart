import 'dart:convert';

import '../../shared_models/shared_classes/api_account.dart';
DrRegisterModel drRegisterModelFromJson(String str) => DrRegisterModel.fromJson(json.decode(str));
String drRegisterModelToJson(DrRegisterModel data) => json.encode(data.toJson());
class DrRegisterModel {
  DrRegisterModel({
      int? status, 
      String? message,
    ApiAccount? account,}){
    _status = status;
    _message = message;
    _account = account;
}

  DrRegisterModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _account = json['account'] != null ? ApiAccount.fromJson(json['account']) : null;
  }
  int? _status;
  String? _message;
  ApiAccount? _account;

  int get status => _status ?? 0;
  String get message => _message ?? '';
  ApiAccount get account => _account ?? ApiAccount();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_account != null) {
      map['account'] = _account?.toJson();
    }
    return map;
  }

}
