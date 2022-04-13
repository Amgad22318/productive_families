
class UserGetProfileModel {
  UserGetProfileModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    account = json['account'] =   Account.fromJson(json['account']);
  }
  int? status;
  String? message;
  late final Account account;

}


class Account {

  Account.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    type = json['type'];
    isVerified = json['is_verified'];
    isActive = json['is_active'];
    image = json['image'] = Image.fromJson(json['image']);
    address = json['address'] = Address.fromJson(json['address']);
    providerAccount = json['provider_account'];
    driverAccount = json['driver_account'];
    userAccount = json['user_account'];
    points = json['points']??0;
    balance = json['balance']??0;
    totalOrders = json['total_orders']??0;
    deviceToken = json['device_token'];
  }
  int? id;
  String? name;
  String? phone;
  String? type;
  int? isVerified;
  int? isActive;
  late Image image;
  Address? address;
  int? providerAccount;
  int? driverAccount;
  int? userAccount;
  num? points;
  num? balance;
  int? totalOrders;
  String? deviceToken;



}


class Address {

  Address.fromJson(dynamic json) {
    id = json['id'];
    address = json['address']??'';
    lon = json['lon'];
    lat = json['lat'];
  }
  int? id;
  String? address;
  late num lon;
  late num lat;

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