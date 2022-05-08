import 'dart:convert';

import 'package:productive_families/data/models/shared_models/shared_classes/api_address.dart';

import '../../shared_models/shared_classes/api_image.dart';
UserOrderShowCheckOutProductsModel userShowCheckOutProductsFromJson(String str) => UserOrderShowCheckOutProductsModel.fromJson(json.decode(str));
String userShowCheckOutProductsToJson(UserOrderShowCheckOutProductsModel data) => json.encode(data.toJson());
class UserOrderShowCheckOutProductsModel {
  UserOrderShowCheckOutProductsModel({
      int? status, 
      String? message, 
      List<OrderProducts>? orderProducts, 
      OrderDetails? orderDetails,}){
    _status = status;
    _message = message;
    _orderProducts = orderProducts;
    _orderDetails = orderDetails;
}

  UserOrderShowCheckOutProductsModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['order_products'] != null) {
      _orderProducts = [];
      json['order_products'].forEach((v) {
        _orderProducts?.add(OrderProducts.fromJson(v));
      });
    }
    _orderDetails = json['order_details'] != null ? OrderDetails.fromJson(json['order_details']) : null;
  }
  int? _status;
  String? _message;
  List<OrderProducts>? _orderProducts;
  OrderDetails? _orderDetails;

  int get status => _status??0;
  String get message => _message??"";
  List<OrderProducts> get orderProducts => _orderProducts??[];
  OrderDetails get orderDetails => _orderDetails??OrderDetails();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_orderProducts != null) {
      map['order_products'] = _orderProducts?.map((v) => v.toJson()).toList();
    }
    if (_orderDetails != null) {
      map['order_details'] = _orderDetails?.toJson();
    }
    return map;
  }

}

OrderDetails orderDetailsFromJson(String str) => OrderDetails.fromJson(json.decode(str));
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
      String? userPhone,
    num? netPrice,
    num? orderPrice,
      int? askForDriver, 
      String? status, 
      String? statusString,}){
    _id = id;
    _fromLocation = fromLocation;
    _toLocation = toLocation;
    _vat = vat;
    _driverCost = driverCost;
    _voucherDiscount = voucherDiscount;
    _note = note;
    _userPhone = userPhone;
    _netPrice = netPrice;
    _orderPrice = orderPrice;
    _askForDriver = askForDriver;
    _status = status;
    _statusString = statusString;
}

  OrderDetails.fromJson(dynamic json) {
    _id = json['id'];
    _fromLocation = json['from_location'] != null ? ApiAddress.fromJson(json['from_location']) : null;
    _toLocation = json['to_location'] != null ? ApiAddress.fromJson(json['to_location']) : null;
    _vat = json['vat'];
    _driverCost = json['driver_cost'];
    _voucherDiscount = json['voucher_discount'];
    _note = json['note'];
    _userPhone = json['user_phone'];
    _netPrice = json['net_price'];
    _orderPrice = json['order_price'];
    _askForDriver = json['ask_for_driver'];
    _status = json['status'];
    _statusString = json['status_string'];
  }
  int? _id;
  ApiAddress? _fromLocation;
  ApiAddress? _toLocation;
  num? _vat;
  num? _driverCost;
  num? _voucherDiscount;
  String? _note;
  String? _userPhone;
  num? _netPrice;
  num? _orderPrice;
  int? _askForDriver;
  String? _status;
  String? _statusString;

  int get id => _id??0;
  ApiAddress get fromLocation => _fromLocation??ApiAddress();
  ApiAddress get toLocation => _toLocation??ApiAddress();
  num get vat => _vat??0;
  num get driverCost => _driverCost??0;
  num get voucherDiscount => _voucherDiscount??0;
  String get note => _note??"";
  String get userPhone => _userPhone??"";
  num get netPrice => _netPrice??0;
  num get orderPrice => _orderPrice??0;
  int get askForDriver => _askForDriver??0;
  String get status => _status??"";
  String get statusString => _statusString??"";

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
    map['user_phone'] = _userPhone;
    map['net_price'] = _netPrice;
    map['order_price'] = _orderPrice;
    map['ask_for_driver'] = _askForDriver;
    map['status'] = _status;
    map['status_string'] = _statusString;
    return map;
  }

}


OrderProducts orderProductsFromJson(String str) => OrderProducts.fromJson(json.decode(str));
String orderProductsToJson(OrderProducts data) => json.encode(data.toJson());
class OrderProducts {
  OrderProducts({
    int? id,
    String? name,
    String? description,
    num? price,
    int? quantity,
    ApiImage? image,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _price = price;
    _quantity = quantity;
    _image = image;
  }

  OrderProducts.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _quantity = json['quantity'];
    _image = json['image'] != null ? ApiImage.fromJson(json['image']) : null;
  }

  int? _id;
  String? _name;
  String? _description;
  num? _price;
  int? _quantity;
  ApiImage? _image;

  int get id => _id ?? 0;

  String get name => _name ?? "";

  String get description => _description ?? "";

  num get price => _price ?? 0;

  int get quantity => _quantity ?? 0;

  ApiImage get image => _image ?? ApiImage();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['price'] = _price;
    map['quantity'] = _quantity;
    if (_image != null) {
      map['image'] = _image?.toJson();
    }
    return map;
  }
}