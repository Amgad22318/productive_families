import 'dart:convert';

import 'package:productive_families/data/models/shared_models/shared_classes/api_image.dart';
UserAllOrdersModel userAllOrdersModelFromJson(String str) => UserAllOrdersModel.fromJson(json.decode(str));
String userAllOrdersModelToJson(UserAllOrdersModel data) => json.encode(data.toJson());
class UserAllOrdersModel {
  UserAllOrdersModel({
      int? status, 
      List<Orders>? orders,}){
    _status = status;
    _orders = orders;
}

  UserAllOrdersModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['orders'] != null) {
      _orders = [];
      json['orders'].forEach((v) {
        _orders?.add(Orders.fromJson(v));
      });
    }
  }
  int? _status;
  List<Orders>? _orders;

  int get status => _status??0;
  List<Orders> get orders => _orders??[];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_orders != null) {
      map['orders'] = _orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Orders ordersFromJson(String str) => Orders.fromJson(json.decode(str));
String ordersToJson(Orders data) => json.encode(data.toJson());
class Orders {
  Orders({
      int? id, 
      int? orderPrice, 
      int? providerId, 
      String? serviceName, 
      String? status, 
      int? voucherId,
    ApiImage? image,
      int? askForDriver, 
      String? note,}){
    _id = id;
    _orderPrice = orderPrice;
    _providerId = providerId;
    _serviceName = serviceName;
    _status = status;
    _voucherId = voucherId;
    _image = image;
    _askForDriver = askForDriver;
    _note = note;
}

  Orders.fromJson(dynamic json) {
    _id = json['id'];
    _orderPrice = json['order_price'];
    _providerId = json['provider_id'];
    _serviceName = json['service_name'];
    _status = json['status'];
    _voucherId = json['voucher_id'];
    _image = json['image'] != null ? ApiImage.fromJson(json['image']) : null;
    _askForDriver = json['ask_for_driver'];
    _note = json['note'];
  }
  int? _id;
  int? _orderPrice;
  int? _providerId;
  String? _serviceName;
  String? _status;
  int? _voucherId;
  ApiImage? _image;
  int? _askForDriver;
  String? _note;

  int get id => _id??0;
  int get orderPrice => _orderPrice??0;
  int get providerId => _providerId??0;
  String get serviceName => _serviceName??"";
  String get status => _status??"";
  int get voucherId => _voucherId??0;
  ApiImage get apiImage => _image??ApiImage();
  int get askForDriver => _askForDriver??0;
  String get note => _note??"";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['order_price'] = _orderPrice;
    map['provider_id'] = _providerId;
    map['service_name'] = _serviceName;
    map['status'] = _status;
    map['voucher_id'] = _voucherId;
    if (_image != null) {
      map['image'] = _image?.toJson();
    }
    map['ask_for_driver'] = _askForDriver;
    map['note'] = _note;
    return map;
  }

}

