import '../../shared_models/shared_classes/api_address.dart';
import '../../shared_models/shared_classes/api_image.dart';

class UserRegisterModel {
  UserRegisterModel.fromJson(dynamic json) {
    status = json['status'];
    account =
        json['account'] != null ? Account.fromJson(json['account']) : null;
    message = json['message'];
  }

  int? status;
  Account? account;
  late String message;

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
}
