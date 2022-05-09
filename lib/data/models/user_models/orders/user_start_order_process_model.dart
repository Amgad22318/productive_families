import 'dart:convert';

import 'package:productive_families/data/models/shared_models/shared_classes/api_address.dart';

UserStartOrderProcessModel userStartOrderProcessModelFromJson(String str) =>
    UserStartOrderProcessModel.fromJson(json.decode(str));

String userStartOrderProcessModelToJson(UserStartOrderProcessModel data) =>
    json.encode(data.toJson());

class UserStartOrderProcessModel {
  UserStartOrderProcessModel({
    int? status,
    String? message,
    OrderDetails? orderDetails,
  }) {
    _status = status;
    _message = message;
    _orderDetails = orderDetails;
  }

  UserStartOrderProcessModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _orderDetails = json['order_details'] != null
        ? OrderDetails.fromJson(json['order_details'])
        : null;
  }

  int? _status;
  String? _message;
  OrderDetails? _orderDetails;

  int get status => _status ?? 0;

  String get message => _message ?? '';

  OrderDetails get orderDetails => _orderDetails ?? OrderDetails();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_orderDetails != null) {
      map['order_details'] = _orderDetails?.toJson();
    }
    return map;
  }
}

OrderDetails orderDetailsFromJson(String str) =>
    OrderDetails.fromJson(json.decode(str));

String orderDetailsToJson(OrderDetails data) => json.encode(data.toJson());

class OrderDetails {
  OrderDetails({
    int? id,
    ApiAddress? fromLocation,
    ApiAddress? toLocation,
    num? vat,
    num? driverCost,
    num? voucherDiscount,
    String? note,
    num? netPrice,
    num? orderPrice,
    int? askForDriver,
    String? status,
    String? userPhone,
    String? statusString,
  }) {
    _id = id;
    _fromLocation = fromLocation;
    _toLocation = toLocation;
    _vat = vat;
    _driverCost = driverCost;
    _voucherDiscount = voucherDiscount;
    _note = note;
    _netPrice = netPrice;
    _orderPrice = orderPrice;
    _askForDriver = askForDriver;
    _status = status;
    _userPhone = userPhone;
    _statusString = statusString;
  }

  OrderDetails.fromJson(dynamic json) {
    _id = json['id'];
    _fromLocation = json['from_location'] != null
        ? ApiAddress.fromJson(json['from_location'])
        : null;
    _toLocation = json['to_location'] != null
        ? ApiAddress.fromJson(json['to_location'])
        : null;
    _vat = json['vat'];
    _driverCost = json['driver_cost'];
    _voucherDiscount = json['voucher_discount'];
    _note = json['note'];
    _netPrice = json['net_price'];
    _orderPrice = json['order_price'];
    _askForDriver = json['ask_for_driver'];
    _status = json['status'];
    _userPhone = json['user_phone'];
    _statusString = json['status_string'];
  }

  int? _id;
  ApiAddress? _fromLocation;
  ApiAddress? _toLocation;
  num? _vat;
  num? _driverCost;
  num? _voucherDiscount;
  String? _note;
  num? _netPrice;
  num? _orderPrice;
  int? _askForDriver;
  String? _status;
  String? _userPhone;
  String? _statusString;

  int get id => _id ?? 0;

  ApiAddress get fromLocation => _fromLocation ?? ApiAddress();

  ApiAddress get toLocation => _toLocation ?? ApiAddress();

  num get vat => _vat ?? 0;

  num get driverCost => _driverCost ?? 0;

  num get voucherDiscount => _voucherDiscount ?? 0;

  String get note => _note ?? '';

  num get netPrice => _netPrice ?? 0;

  num get orderPrice => _orderPrice ?? 0;

  int get askForDriver => _askForDriver ?? 0;

  String get status => _status ?? "";

  String get userPhone => _userPhone ?? "";

  String get statusString => _statusString ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_fromLocation != null) {
      map['from_location'] = _fromLocation?.toJson();
    }
    if (_toLocation != null) {
      map['to_location'] = _toLocation?.toJson();
    }
    map['vat'] = _vat;
    map['driver_cost'] = _driverCost;
    map['voucher_discount'] = _voucherDiscount;
    map['note'] = _note;
    map['net_price'] = _netPrice;
    map['order_price'] = _orderPrice;
    map['ask_for_driver'] = _askForDriver;
    map['status'] = _status;
    map['user_phone'] = _userPhone;
    map['status_string'] = _statusString;
    return map;
  }
}
