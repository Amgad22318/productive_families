import 'dart:convert';

import '../../shared_models/shared_classes/api_address.dart';
import '../../shared_models/shared_classes/api_image.dart';
UserUpdateProfileModel userUpdateProfileFromJson(String str) => UserUpdateProfileModel.fromJson(json.decode(str));
String userUpdateProfileToJson(UserUpdateProfileModel data) => json.encode(data.toJson());
class UserUpdateProfileModel {
  UserUpdateProfileModel({
      this.status, 
      this.message, 
      this.account,});

  UserUpdateProfileModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    account = json['account'] != null ? Account.fromJson(json['account']) : null;
  }
  int? status;
  String? message;
  Account? account;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (account != null) {
      map['account'] = account?.toJson();
    }
    return map;
  }

}

Account accountFromJson(String str) => Account.fromJson(json.decode(str));
String accountToJson(Account data) => json.encode(data.toJson());
class Account {
  // Account({
  //     this.id,
  //     this.name,
  //     this.phone,
  //     this.type,
  //     this.isVerified,
  //     this.isActive,
  //     this.image,
  //     this.address,
  //     this.providerAccount,
  //     this.driverAccount,
  //     this.userAccount,
  //     this.points,
  //     this.balance,
  //     this.totalOrders,
  //     this.deviceToken,});

  Account.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    type = json['type'];
    isVerified = json['is_verified'];
    isActive = json['is_active'];
    image = ApiImage.fromJson(json['image']);
    address = ApiAddress.fromJson(json['address']);
    providerAccount = json['provider_account'];
    driverAccount = json['driver_account'];
    userAccount = json['user_account'];
    points = json['points'];
    balance = json['balance'];
    totalOrders = json['total_orders'];
    deviceToken = json['device_token'];
  }
  int? id;
  String? name;
  String? phone;
  String? type;
  int? isVerified;
  int? isActive;
  late ApiImage image;
  late ApiAddress address;
  int? providerAccount;
  int? driverAccount;
  int? userAccount;
  dynamic points;
  dynamic balance;
  int? totalOrders;
  String? deviceToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['type'] = type;
    map['is_verified'] = isVerified;
    map['is_active'] = isActive;
      map['image'] = image.toJson();
      map['address'] = address.toJson();
    map['provider_account'] = providerAccount;
    map['driver_account'] = driverAccount;
    map['user_account'] = userAccount;
    map['points'] = points;
    map['balance'] = balance;
    map['total_orders'] = totalOrders;
    map['device_token'] = deviceToken;
    return map;
  }

}

