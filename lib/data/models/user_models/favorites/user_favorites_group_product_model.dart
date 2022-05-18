import 'dart:convert';

import 'package:productive_families/data/models/shared_models/shared_classes/api_image.dart';
UserFavoritesGroupProductModel userFavoritesGroupProductModelFromJson(String str) => UserFavoritesGroupProductModel.fromJson(json.decode(str));
String userFavoritesGroupProductModelToJson(UserFavoritesGroupProductModel data) => json.encode(data.toJson());
class UserFavoritesGroupProductModel {
  UserFavoritesGroupProductModel({
      int? status, 
      String? message, 
      String? groupTitle, 
      List<Products>? products,}){
    _status = status;
    _message = message;
    _groupTitle = groupTitle;
    _products = products;
}

  UserFavoritesGroupProductModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _groupTitle = json['group_title'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  int? _status;
  String? _message;
  String? _groupTitle;
  List<Products>? _products;

  int get status => _status??0;
  String get message => _message??"";
  String get groupTitle => _groupTitle??"";
  List<Products> get products => _products??[];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['group_title'] = _groupTitle;
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
      String? name, 
      String? description,
    num? price,
      ApiImage? image,
      int? favorite,
    num? rate,
      int? rateTimes,}){
    _id = id;
    _name = name;
    _description = description;
    _price = price;
    _image = image;
    _favorite = favorite;
    _rate = rate;
    _rateTimes = rateTimes;
}

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _image = json['image'] != null ? ApiImage.fromJson(json['image']) : null;
    _favorite = json['favorite'];
    _rate = json['rate'];
    _rateTimes = json['rate_times'];
  }
  int? _id;
  String? _name;
  String? _description;
  num? _price;
  ApiImage? _image;
  int? _favorite;
  num? _rate;
  int? _rateTimes;

  int get id => _id??0;
  String get name => _name??"";
  String get description => _description??"";
  num get price => _price??0;
  ApiImage get image => _image??ApiImage();
  int get favorite => _favorite??0;
  num get rate => _rate??0;
  int get rateTimes => _rateTimes??0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['price'] = _price;
    if (_image != null) {
      map['image'] = _image?.toJson();
    }
    map['favorite'] = _favorite;
    map['rate'] = _rate;
    map['rate_times'] = _rateTimes;
    return map;
  }

}

