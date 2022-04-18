
import 'package:productive_families/data/models/shared_models/shared_classes/api_address.dart';
import 'package:productive_families/data/models/shared_models/shared_classes/api_image.dart';

class UserGetProfileModel {
  UserGetProfileModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    account = json['account'] =   Account.fromJson(json['account']);
  }
  int? status;
  String? message;
  late  Account account;

}


class Account {

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
  late ApiImage image;
  late ApiAddress address;
  int? providerAccount;
  int? driverAccount;
  int? userAccount;
  num? points;
  num? balance;
  int? totalOrders;
  String? deviceToken;



}





