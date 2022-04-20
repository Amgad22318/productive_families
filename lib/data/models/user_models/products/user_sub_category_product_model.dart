import 'dart:convert';

import 'package:productive_families/data/models/shared_models/shared_classes/api_image.dart';
UserSubCategoryProductModel userSubCategoryProductModelFromJson(String str) => UserSubCategoryProductModel.fromJson(json.decode(str));
String userSubCategoryProductModelToJson(UserSubCategoryProductModel data) => json.encode(data.toJson());
class UserSubCategoryProductModel {
  // UserSubCategoryProductModel({
  //     this.status,
  //     this.message,
  //     this.subCategoryName,
  //     this.products,});

  UserSubCategoryProductModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message']??'';
    subCategoryName = json['sub_category_name']??'';
    products = [];
    if (json['products'] != null) {
      json['products'].forEach((v) {
        products.add(Products.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  String? subCategoryName;
  late List<Products> products;
// UserSubCategoryProductModel copyWith({  int? status,
//   String? message,
//   String? subCategoryName,
//   List<Products>? products,
// }) => UserSubCategoryProductModel(  status: status ?? this.status,
//   message: message ?? this.message,
//   subCategoryName: subCategoryName ?? this.subCategoryName,
//   products: products ?? this.products,
// );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['sub_category_name'] = subCategoryName;
      map['products'] = products.map((v) => v.toJson()).toList();
    return map;
  }

}

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());
class Products {
  // Products({
  //     this.id,
  //     this.subCategoryName,
  //     this.subCategoryId,
  //     this.serviceName,
  //     this.providerId,
  //     this.name,
  //     this.price,
  //     this.image,
  //     this.favorite,
  //     this.rate,
  //     this.rateTimes,});

  Products.fromJson(dynamic json) {
    id = json['id'];
    subCategoryName = json['sub_category_name'];
    subCategoryId = json['sub_category_id'];
    serviceName = json['service_name'];
    providerId = json['provider_id'];
    name = json['name'];
    price = json['price'];
    image = ApiImage.fromJson(json['image']);
    favorite = json['favorite'];
    rate = json['rate'];
    rateTimes = json['rate_times'];
  }
  late int id;
  late String subCategoryName;
  late int subCategoryId;
  late String serviceName;
  late  int providerId;
  late String name;
  late  num price;
  late ApiImage image;
  late  int favorite;
  late  num rate;
  late  int rateTimes;
// Products copyWith({  int? id,
//   String? subCategoryName,
//   int? subCategoryId,
//   String? serviceName,
//   int? providerId,
//   String? name,
//   int? price,
//   Image? image,
//   int? favorite,
//   int? rate,
//   int? rateTimes,
// }) => Products(  id: id ?? this.id,
//   subCategoryName: subCategoryName ?? this.subCategoryName,
//   subCategoryId: subCategoryId ?? this.subCategoryId,
//   serviceName: serviceName ?? this.serviceName,
//   providerId: providerId ?? this.providerId,
//   name: name ?? this.name,
//   price: price ?? this.price,
//   image: image ?? this.image,
//   favorite: favorite ?? this.favorite,
//   rate: rate ?? this.rate,
//   rateTimes: rateTimes ?? this.rateTimes,
// );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sub_category_name'] = subCategoryName;
    map['sub_category_id'] = subCategoryId;
    map['service_name'] = serviceName;
    map['provider_id'] = providerId;
    map['name'] = name;
    map['price'] = price;
      map['image'] = image.toJson();
    map['favorite'] = favorite;
    map['rate'] = rate;
    map['rate_times'] = rateTimes;
    return map;
  }

}

