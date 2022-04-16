import 'dart:convert';
UserLoginModel userLoginModelFromJson(String str) => UserLoginModel.fromJson(json.decode(str));
String userLoginModelToJson(UserLoginModel data) => json.encode(data.toJson());
class UserLoginModel {
  UserLoginModel({
      this.status,
      this.message,
      this.user,
      this.accessToken,
      this.tokenType,});

  UserLoginModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }
  int? status;
  String? message;
  User? user;
  String? accessToken;
  String? tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['access_token'] = accessToken;
    map['token_type'] = tokenType;
    return map;
  }

}

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      this.id,
      this.name,
      this.phone,
      this.type,
      this.isVerified,
      this.isActive,
      this.image,
      this.address,
      this.providerAccount,
      this.driverAccount,
      this.userAccount,
      this.points,
      this.balance,
      this.totalOrders,
      this.deviceToken,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    type = json['type'];
    isVerified = json['is_verified'];
    isActive = json['is_active'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
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
  Image? image;
  Address? address;
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
    if (image != null) {
      map['image'] = image?.toJson();
    }
    if (address != null) {
      map['address'] = address?.toJson();
    }
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

Address addressFromJson(String str) => Address.fromJson(json.decode(str));
String addressToJson(Address data) => json.encode(data.toJson());
class Address {
  Address({
      this.id,
      this.address,
      this.lon,
      this.lat,});

  Address.fromJson(dynamic json) {
    id = json['id'];
    address = json['address'];
    lon = json['lon'];
    lat = json['lat'];
  }
  int? id;
  String? address;
  dynamic lon;
  dynamic lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['address'] = address;
    map['lon'] = lon;
    map['lat'] = lat;
    return map;
  }

}

Image imageFromJson(String str) => Image.fromJson(json.decode(str));
String imageToJson(Image data) => json.encode(data.toJson());
class Image {
  Image({
      this.id,
      this.path,
      this.type,});

  Image.fromJson(dynamic json) {
    id = json['id']??0;
    path = json['path']??'';
    type = json['type']??'';
  }
  int? id;
  String? path;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['path'] = path;
    map['type'] = type;
    return map;
  }

}