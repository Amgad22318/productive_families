import 'dart:convert';

import '../../shared_models/shared_classes/api_review.dart';

ProductRatesModel productRatesModelFromJson(String str) =>
    ProductRatesModel.fromJson(json.decode(str));
String productRatesModelToJson(ProductRatesModel data) =>
    json.encode(data.toJson());

class ProductRatesModel {
  ProductRatesModel({
    int? status,
    String? message,
    List<ApiReview>? groups,
    int? pageCount,
  }) {
    _status = status;
    _message = message;
    _groups = groups;
    _pageCount = pageCount;
  }

  ProductRatesModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['groups'] != null) {
      _groups = [];
      json['groups'].forEach((v) {
        _groups?.add(ApiReview.fromJson(v));
      });
    }
    _pageCount = json['page_count'];
  }
  int? _status;
  String? _message;
  List<ApiReview>? _groups;
  int? _pageCount;

  int get status => _status ?? 0;
  String get message => _message ?? "";
  List<ApiReview> get reviews => _groups ?? [];
  int get pageCount => _pageCount ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_groups != null) {
      map['groups'] = _groups?.map((v) => v.toJson()).toList();
    }
    map['page_count'] = _pageCount;
    return map;
  }
}
