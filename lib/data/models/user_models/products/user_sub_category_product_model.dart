import 'dart:convert';

import '../../shared_models/shared_classes/api_product.dart';

UserSubCategoryProductModel userSubCategoryProductModelFromJson(String str) =>
    UserSubCategoryProductModel.fromJson(json.decode(str));
String userSubCategoryProductModelToJson(UserSubCategoryProductModel data) =>
    json.encode(data.toJson());

class UserSubCategoryProductModel {
  UserSubCategoryProductModel({
    int? status,
    String? message,
    String? subCategoryName,
    List<ApiProduct>? products,
  }) {
    _status = status;
    _message = message;
    _subCategoryName = subCategoryName;
    _products = products;
  }

  UserSubCategoryProductModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _subCategoryName = json['sub_category_name'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(ApiProduct.fromJson(v));
      });
    }
  }
  int? _status;
  String? _message;
  String? _subCategoryName;
  List<ApiProduct>? _products;

  int get status => _status ?? 0;
  String get message => _message ?? "";
  String get subCategoryName => _subCategoryName ?? "";
  List<ApiProduct> get products => _products ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['sub_category_name'] = _subCategoryName;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
