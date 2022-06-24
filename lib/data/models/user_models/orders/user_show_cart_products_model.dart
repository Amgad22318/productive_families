import 'dart:convert';

import 'package:productive_families/data/models/shared_models/shared_classes/api_image.dart';

UserShowCartProductsModel userShowCartProductsModelFromJson(String str) =>
    UserShowCartProductsModel.fromJson(json.decode(str));
String userShowCartProductsModelToJson(UserShowCartProductsModel data) =>
    json.encode(data.toJson());

class UserShowCartProductsModel {
  UserShowCartProductsModel({
    int? status,
    String? message,
    List<Products>? products,
    int? pageCount,
  }) {
    _status = status;
    _message = message;
    _products = products;
    _pageCount = pageCount;
  }

  UserShowCartProductsModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
    _pageCount = json['page_count'];
  }
  int? _status;
  String? _message;
  List<Products>? _products;
  int? _pageCount;

  int get status => _status ?? 0;
  String get message => _message ?? '';
  List<Products> get products => _products ?? [];
  int get pageCount => _pageCount ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['page_count'] = _pageCount;
    return map;
  }
}

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    int? cartId,
    int? productId,
    String? productName,
    String? serviceName,
    String? description,
    num? price,
    int? quantity,
    ApiImage? image,
  }) {
    _cartId = cartId;
    _productId = productId;
    _productName = productName;
    _serviceName = serviceName;
    _description = description;
    _price = price;
    _quantity = quantity;
    _image = image;
  }

  Products.fromJson(dynamic json) {
    _cartId = json['cart_id'];
    _productId = json['product_id'];
    _productName = json['product_name'];
    _serviceName = json['service_name'];
    _description = json['description'];
    _price = json['price'];
    _quantity = json['quantity'];
    _image = json['image'] != null ? ApiImage.fromJson(json['image']) : null;
  }
  int? _cartId;
  int? _productId;
  String? _productName;
  String? _serviceName;
  String? _description;
  num? _price;
  int? _quantity;
  ApiImage? _image;

  int get cartId => _cartId ?? 0;
  int get productId => _productId ?? 0;
  String get productName => _productName ?? "";
  String get serviceName => _serviceName ?? "";
  String get description => _description ?? "";
  num get price => _price ?? 0;
  int get quantity => _quantity ?? 0;
  ApiImage get image => _image ?? ApiImage();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cart_id'] = _cartId;
    map['product_id'] = _productId;
    map['product_name'] = _productName;
    map['service_name'] = _serviceName;
    map['description'] = _description;
    map['price'] = _price;
    map['quantity'] = _quantity;
    if (_image != null) {
      map['image'] = _image?.toJson();
    }
    return map;
  }
}

Image imageFromJson(String str) => Image.fromJson(json.decode(str));
String imageToJson(Image data) => json.encode(data.toJson());

class Image {
  Image({
    dynamic id,
    dynamic path,
    dynamic type,
  }) {
    _id = id;
    _path = path;
    _type = type;
  }

  Image.fromJson(dynamic json) {
    _id = json['id'];
    _path = json['path'];
    _type = json['type'];
  }
  dynamic _id;
  dynamic _path;
  dynamic _type;

  dynamic get id => _id;
  dynamic get path => _path;
  dynamic get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['path'] = _path;
    map['type'] = _type;
    return map;
  }
}
