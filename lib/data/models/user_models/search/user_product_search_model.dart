import 'dart:convert';

import 'package:productive_families/data/models/shared_models/shared_classes/api_image.dart';
UserProductSearchModel userProductSearchModelFromJson(String str) => UserProductSearchModel.fromJson(json.decode(str));
String userProductSearchModelToJson(UserProductSearchModel data) => json.encode(data.toJson());
class UserProductSearchModel {
  UserProductSearchModel({
      int? status, 
      String? message, 
      String? keyWord, 
      List<Products>? products,}){
    _status = status;
    _message = message;
    _keyWord = keyWord;
    _products = products;
}

  UserProductSearchModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _keyWord = json['key_word'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  int? _status;
  String? _message;
  String? _keyWord;
  List<Products>? _products;

  int get status => _status??0;
  String get message => _message??"";
  String get keyWord => _keyWord??"";
  List<Products> get products => _products??[];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['key_word'] = _keyWord;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());
class Products {
  Products({
      int? id, 
      String? subCategoryName, 
      int? subCategoryId, 
      String? serviceName, 
      int? providerId, 
      String? name,
    num? price,
      int? favourite, 
      ApiImage? image,
    num? rate,
      int? rateTimes,}){
    _id = id;
    _subCategoryName = subCategoryName;
    _subCategoryId = subCategoryId;
    _serviceName = serviceName;
    _providerId = providerId;
    _name = name;
    _price = price;
    _favourite = favourite;
    _image = image;
    _rate = rate;
    _rateTimes = rateTimes;
}

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _subCategoryName = json['sub_category_name'];
    _subCategoryId = json['sub_category_id'];
    _serviceName = json['service_name'];
    _providerId = json['provider_id'];
    _name = json['name'];
    _price = json['price'];
    _favourite = json['favourite'];
    _image = json['image'] != null ? ApiImage.fromJson(json['image']) : null;
    _rate = json['rate'];
    _rateTimes = json['rate_times'];
  }
  int? _id;
  String? _subCategoryName;
  int? _subCategoryId;
  String? _serviceName;
  int? _providerId;
  String? _name;
  num? _price;
  int? _favourite;

  set setFavourite(int value) {
    _favourite = value;
  }

  ApiImage? _image;
  num? _rate;
  int? _rateTimes;

  int get id => _id??0;
  String get subCategoryName => _subCategoryName??"";
  int get subCategoryId => _subCategoryId??0;
  String get serviceName => _serviceName??"";
  int get providerId => _providerId??0;
  String get name => _name??"";
  num get price => _price??0;
  int get favourite => _favourite??0;
  ApiImage get image => _image??ApiImage();
  num get rate => _rate??0;
  int get rateTimes => _rateTimes??0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['sub_category_name'] = _subCategoryName;
    map['sub_category_id'] = _subCategoryId;
    map['service_name'] = _serviceName;
    map['provider_id'] = _providerId;
    map['name'] = _name;
    map['price'] = _price;
    map['favourite'] = _favourite;
    if (_image != null) {
      map['image'] = _image?.toJson();
    }
    map['rate'] = _rate;
    map['rate_times'] = _rateTimes;
    return map;
  }

}

