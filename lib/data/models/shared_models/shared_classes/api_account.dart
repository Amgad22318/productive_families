import 'dart:convert';

import 'api_address.dart';
import 'api_image.dart';

ApiAccount accountFromJson(String str) => ApiAccount.fromJson(json.decode(str));
String accountToJson(ApiAccount data) => json.encode(data.toJson());
class ApiAccount {
  ApiAccount({
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
    num? points,
    num? balance,
    int? totalOrders,
    String? deviceToken,}){
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

  ApiAccount.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
    _type = json['type'];
    _isVerified = json['is_verified'];
    _isActive = json['is_active'];
    _image = json['image'] != null ? ApiImage.fromJson(json['image']) : null;
    _address = json['address'] != null ? ApiAddress.fromJson(json['address']) : null;
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
  num? _points;
  num? _balance;
  int? _totalOrders;
  String? _deviceToken;

  int get id => _id??0;
  String get name => _name??"";
  String get phone => _phone??"";
  String get type => _type??"";
  int get isVerified => _isVerified??0;
  int get isActive => _isActive??0;
  ApiImage get image => _image??ApiImage();
  ApiAddress get address => _address??ApiAddress();
  int get providerAccount => _providerAccount??0;
  int get driverAccount => _driverAccount??0;
  int get userAccount => _userAccount??0;
  num get points => _points??0;
  num get balance => _balance??0;
  int get totalOrders => _totalOrders??0;
  String get deviceToken => _deviceToken??"";

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