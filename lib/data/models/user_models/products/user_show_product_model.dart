import 'dart:convert';

import '../../shared_models/shared_classes/api_product.dart';

UserShowProductModel userShowProductModelFromJson(String str) =>
    UserShowProductModel.fromJson(json.decode(str));
String userShowProductModelToJson(UserShowProductModel data) =>
    json.encode(data.toJson());

class UserShowProductModel {
  UserShowProductModel({
    int? status,
    String? message,
    ApiProduct? product,
  }) {
    _status = status;
    _message = message;
    _product = product;
  }

  UserShowProductModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _product =
        json['product'] != null ? ApiProduct.fromJson(json['product']) : null;
  }
  int? _status;
  String? _message;
  ApiProduct? _product;

  int get status => _status ?? 0;
  String get message => _message ?? "";
  ApiProduct get product => _product ?? ApiProduct();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    return map;
  }
}
