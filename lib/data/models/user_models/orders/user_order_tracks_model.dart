import 'dart:convert';

import 'package:productive_families/data/models/shared_models/shared_classes/api_address.dart';
import 'package:productive_families/data/models/shared_models/shared_classes/api_image.dart';

UserOrderTracksModel userOrderTracksModelFromJson(String str) =>
    UserOrderTracksModel.fromJson(json.decode(str));

String userOrderTracksModelToJson(UserOrderTracksModel data) =>
    json.encode(data.toJson());

class UserOrderTracksModel {
  UserOrderTracksModel({
    int? status,
    String? message,
    int? deliveryTime,
    List<Tracks>? tracks,
    OrderDetails? orderDetails,
  }) {
    _status = status;
    _message = message;
    _deliveryTime = deliveryTime;
    _tracks = tracks;
    _orderDetails = orderDetails;
  }

  UserOrderTracksModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _deliveryTime = json['deliveryTime'];
    if (json['tracks'] != null) {
      _tracks = [];
      json['tracks'].forEach((v) {
        _tracks?.add(Tracks.fromJson(v));
      });
    }
    _orderDetails = json['orderDetails'] != null
        ? OrderDetails.fromJson(json['orderDetails'])
        : null;
  }

  int? _status;
  String? _message;
  int? _deliveryTime;
  List<Tracks>? _tracks;
  OrderDetails? _orderDetails;

  int get status => _status ?? 0;

  String get message => _message ?? "";

  int get deliveryTime => _deliveryTime ?? 0;

  List<Tracks> get tracks => _tracks ?? [];

  OrderDetails get orderDetails => _orderDetails ?? OrderDetails();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['deliveryTime'] = _deliveryTime;
    if (_tracks != null) {
      map['tracks'] = _tracks?.map((v) => v.toJson()).toList();
    }
    if (_orderDetails != null) {
      map['orderDetails'] = _orderDetails?.toJson();
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
    num? orderPrice,
    int? providerId,
    int? driverId,
    String? serviceName,
    String? status,
    String? statusString,
    int? voucherId,
    ApiImage? image,
    int? askForDriver,
    ApiAddress? fromLocation,
    ApiAddress? toLocation,
    String? note,
    String? userPhone,
  }) {
    _id = id;
    _orderPrice = orderPrice;
    _providerId = providerId;
    _driverId = driverId;
    _serviceName = serviceName;
    _status = status;
    _statusString = statusString;
    _voucherId = voucherId;
    _image = image;
    _askForDriver = askForDriver;
    _fromLocation = fromLocation;
    _toLocation = toLocation;
    _note = note;
    _userPhone = userPhone;
  }

  OrderDetails.fromJson(dynamic json) {
    _id = json['id'];
    _orderPrice = json['order_price'];
    _providerId = json['provider_id'];
    _driverId = json['driver_id'];
    _serviceName = json['service_name'];
    _status = json['status'];
    _statusString = json['status_string'];
    _voucherId = json['voucher_id'];
    _image = json['image'] != null ? ApiImage.fromJson(json['image']) : null;
    _askForDriver = json['ask_for_driver'];
    _fromLocation = json['from_location'] != null
        ? ApiAddress.fromJson(json['from_location'])
        : null;
    _toLocation = json['to_location'] != null
        ? ApiAddress.fromJson(json['to_location'])
        : null;
    _note = json['note'];
    _userPhone = json['user_phone'];
  }

  int? _id;
  num? _orderPrice;
  int? _providerId;
  int? _driverId;
  String? _serviceName;
  String? _status;
  String? _statusString;
  int? _voucherId;
  ApiImage? _image;
  int? _askForDriver;
  ApiAddress? _fromLocation;
  ApiAddress? _toLocation;
  String? _note;
  String? _userPhone;

  int get id => _id ?? 0;

  num get orderPrice => _orderPrice ?? 0;

  int get providerId => _providerId ?? 0;

  int get driverId => _driverId ?? 0;

  String get serviceName => _serviceName ?? "";

  String get status => _status ?? "";

  String get statusString => _statusString ?? "";

  int get voucherId => _voucherId ?? 0;

  ApiImage get image => _image ?? ApiImage();

  int get askForDriver => _askForDriver ?? 0;

  ApiAddress get fromLocation => _fromLocation ?? ApiAddress();

  ApiAddress get toLocation => _toLocation ?? ApiAddress();

  String get note => _note ?? "";

  String get userPhone => _userPhone ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['order_price'] = _orderPrice;
    map['provider_id'] = _providerId;
    map['driver_id'] = _driverId;
    map['service_name'] = _serviceName;
    map['status'] = _status;
    map['status_string'] = _statusString;
    map['voucher_id'] = _voucherId;
    if (_image != null) {
      map['image'] = _image?.toJson();
    }
    map['ask_for_driver'] = _askForDriver;
    if (_fromLocation != null) {
      map['from_location'] = _fromLocation?.toJson();
    }
    if (_toLocation != null) {
      map['to_location'] = _toLocation?.toJson();
    }
    map['note'] = _note;
    map['user_phone'] = _userPhone;
    return map;
  }
}

Tracks tracksFromJson(String str) => Tracks.fromJson(json.decode(str));

String tracksToJson(Tracks data) => json.encode(data.toJson());

class Tracks {
  Tracks({
    int? id,
    String? status,
    String? statusString,
    String? time,
    bool? check,
  }) {
    _id = id;
    _status = status;
    _statusString = statusString;
    _time = time;
    _check = check;
  }

  Tracks.fromJson(dynamic json) {
    _id = json['id'];
    _status = json['status'];
    _statusString = json['status_string'];
    _time = json['time'];
    _check = json['check'];
  }

  int? _id;
  String? _status;
  String? _statusString;
  String? _time;
  bool? _check;

  int get id => _id ?? 0;

  String get status => _status ?? "";

  String get statusString => _statusString ?? "";

  String get time => _time ?? "";

  bool get check => _check ?? false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['status'] = _status;
    map['status_string'] = _statusString;
    map['time'] = _time;
    map['check'] = _check;
    return map;
  }
}
