import 'dart:convert';
import '../../shared_models/shared_classes/api_account.dart';

DRLoginModel drLoginModelFromJson(String str) =>
    DRLoginModel.fromJson(json.decode(str));
String drLoginModelToJson(DRLoginModel data) => json.encode(data.toJson());

class DRLoginModel {
  DRLoginModel({
    int? status,
    String? message,
    ApiAccount? user,
    String? accessToken,
    String? tokenType,
  }) {
    _status = status;
    _message = message;
    _user = user;
    _accessToken = accessToken;
    _tokenType = tokenType;
  }

  DRLoginModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _user = json['user'] != null ? ApiAccount.fromJson(json['user']) : null;
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
  }
  int? _status;
  String? _message;
  ApiAccount? _user;
  String? _accessToken;
  String? _tokenType;

  int get status => _status ?? 0;
  String get message => _message ?? "";
  ApiAccount get user => _user ?? ApiAccount();
  String get accessToken => _accessToken ?? "";
  String get tokenType => _tokenType ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['access_token'] = _accessToken;
    map['token_type'] = _tokenType;
    return map;
  }
}
