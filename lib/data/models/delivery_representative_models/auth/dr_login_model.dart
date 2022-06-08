import 'dart:convert';

import 'package:productive_families/data/models/shared_models/shared_classes/api_address.dart';
import 'package:productive_families/data/models/shared_models/shared_classes/api_image.dart';

DRLoginModel drLoginModelFromJson(String str) =>
    DRLoginModel.fromJson(json.decode(str));
String drLoginModelToJson(DRLoginModel data) => json.encode(data.toJson());

class DRLoginModel {
  DRLoginModel({
    int? status,
    String? message,
    User? user,
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
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
  }
  int? _status;
  String? _message;
  User? _user;
  String? _accessToken;
  String? _tokenType;

  int get status => _status ?? 0;
  String get message => _message ?? "";
  User get user => _user ?? User();
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

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    int? id,
    String? name,
    String? phone,
    String? type,
    int? isVerified,
    int? isActive,
    ApiImage? image,
    ApiAddress? address,
    int? providerAccount,
    int? driverAccount,
    int? userAccount,
    int? points,
    int? balance,
    int? totalOrders,
    String? deviceToken,
  }) {
    _id = id;
    _name = name;
    _phone = phone;
    _type = type;
    _isVerified = isVerified;
    _isActive = isActive;
    _image = image;
    _address = address;
    _providerAccount = providerAccount;
    _driverAccount = driverAccount;
    _userAccount = userAccount;
    _points = points;
    _balance = balance;
    _totalOrders = totalOrders;
    _deviceToken = deviceToken;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
    _type = json['type'];
    _isVerified = json['is_verified'];
    _isActive = json['is_active'];
    _image = json['image'] != null ? ApiImage.fromJson(json['image']) : null;
    _address =
        json['address'] != null ? ApiAddress.fromJson(json['address']) : null;
    _providerAccount = json['provider_account'];
    _driverAccount = json['driver_account'];
    _userAccount = json['user_account'];
    _points = json['points'];
    _balance = json['balance'];
    _totalOrders = json['total_orders'];
    _deviceToken = json['device_token'];
  }
  int? _id;
  String? _name;
  String? _phone;
  String? _type;
  int? _isVerified;
  int? _isActive;
  ApiImage? _image;
  ApiAddress? _address;
  int? _providerAccount;
  int? _driverAccount;
  int? _userAccount;
  int? _points;
  int? _balance;
  int? _totalOrders;
  String? _deviceToken;

  int? get id => _id;
  String? get name => _name;
  String? get phone => _phone;
  String? get type => _type;
  int? get isVerified => _isVerified;
  int? get isActive => _isActive;
  ApiImage? get image => _image;
  ApiAddress? get address => _address;
  int? get providerAccount => _providerAccount;
  int? get driverAccount => _driverAccount;
  int? get userAccount => _userAccount;
  int? get points => _points;
  int? get balance => _balance;
  int? get totalOrders => _totalOrders;
  String? get deviceToken => _deviceToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    map['type'] = _type;
    map['is_verified'] = _isVerified;
    map['is_active'] = _isActive;
    if (_image != null) {
      map['image'] = _image?.toJson();
    }
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    map['provider_account'] = _providerAccount;
    map['driver_account'] = _driverAccount;
    map['user_account'] = _userAccount;
    map['points'] = _points;
    map['balance'] = _balance;
    map['total_orders'] = _totalOrders;
    map['device_token'] = _deviceToken;
    return map;
  }
}
