import 'dart:convert';

import 'package:productive_families/data/models/shared_models/shared_classes/api_product.dart';

UserTopRatedProductsModel userTopRatedProductsModelFromJson(String str) =>
    UserTopRatedProductsModel.fromJson(json.decode(str));
String userTopRatedProductsModelToJson(UserTopRatedProductsModel data) =>
    json.encode(data.toJson());

class UserTopRatedProductsModel {
  UserTopRatedProductsModel({
    int? status,
    String? message,
    List<ApiProduct>? products,
  }) {
    _status = status;
    _message = message;
    _products = products;
  }

  UserTopRatedProductsModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(ApiProduct.fromJson(v));
      });
    }
  }
  int? _status;
  String? _message;
  List<ApiProduct>? _products;

  int get status => _status ?? 0;
  String get message => _message ?? "";
  List<ApiProduct> get products => _products ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
