
class UserGetProfileModel {
  UserGetProfileModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    account = json['account'] != null ? Account.fromJson(json['account']) : null;
  }
  int? status;
  String? message;
  Account? account;

}


class Account {

  Account.fromJson(dynamic json) {
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



}


class Address {

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

}


class Image {

  Image.fromJson(dynamic json) {
    id = json['id'];
    path = json['path'];
    type = json['type'];
  }
  int? id;
  String? path;
  String? type;

}