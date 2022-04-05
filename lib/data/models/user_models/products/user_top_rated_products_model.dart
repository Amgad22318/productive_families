import 'dart:convert';

UserTopRatedProductsModel userTopRatedProductsModelFromJson(String str) =>
    UserTopRatedProductsModel.fromJson(json.decode(str));

String userTopRatedProductsModelToJson(UserTopRatedProductsModel data) =>
    json.encode(data.toJson());

class UserTopRatedProductsModel {
  UserTopRatedProductsModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }

  int? status;
  String? message;
  List<Products>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products.fromJson(dynamic json) {
    id = json['id'];
    subCategoryName = json['sub_category_name'];
    subCategoryId = json['sub_category_id'];
    serviceName = json['service_name'];
    providerId = json['provider_id'];
    name = json['name'];
    price = json['price'];
    image = json['image'] != null ? ProductImage.fromJson(json['image']) : null;
    favorite = json['favorite'];
    rate = json['rate'];
    rateTimes = json['rate_times'];
  }

  int? id;
  late String subCategoryName;
  int? subCategoryId;
  late String serviceName;
  int? providerId;
  late String name;
  late num price;
  ProductImage? image;
  late int favorite;
  late  num rate;
  late int rateTimes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sub_category_name'] = subCategoryName;
    map['sub_category_id'] = subCategoryId;
    map['service_name'] = serviceName;
    map['provider_id'] = providerId;
    map['name'] = name;
    map['price'] = price;
    if (image != null) {
      map['image'] = image?.toJson();
    }
    map['favorite'] = favorite;
    map['rate'] = rate;
    map['rate_times'] = rateTimes;
    return map;
  }
}

ProductImage imageFromJson(String str) =>
    ProductImage.fromJson(json.decode(str));

String imageToJson(ProductImage data) => json.encode(data.toJson());

class ProductImage {
  ProductImage.fromJson(dynamic json) {
    id = json['id'];
    path = json['path'];
    type = json['type'];
  }

  int? id;
  String? path;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['path'] = path;
    map['type'] = type;
    return map;
  }
}
