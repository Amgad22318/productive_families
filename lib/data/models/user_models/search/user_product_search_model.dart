import 'dart:convert';
UserProductSearchModel userProductSearchModelFromJson(String str) => UserProductSearchModel.fromJson(json.decode(str));
String userProductSearchModelToJson(UserProductSearchModel data) => json.encode(data.toJson());
class UserProductSearchModel {
  UserProductSearchModel({
      this.status, 
      this.message, 
      this.keyWord, 
      this.products,});

  UserProductSearchModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message']??'';
    keyWord = json['key_word']??'';
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  String? keyWord;
  List<Products>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['key_word'] = keyWord;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());
class Products {
  Products({
      this.id, 
      this.subCategoryName, 
      this.subCategoryId, 
      this.serviceName, 
      this.providerId, 
      this.name, 
      this.price, 
      this.image, 
      this.rate, 
      this.rateTimes,});

  Products.fromJson(dynamic json) {
    id = json['id'];
    subCategoryName = json['sub_category_name'];
    subCategoryId = json['sub_category_id'];
    serviceName = json['service_name'];
    providerId = json['provider_id'];
    name = json['name'];
    price = json['price'];
    image = json['image'] != null ? ProductImage.fromJson(json['image']) : null;
    rate = json['rate'];
    rateTimes = json['rate_times'];
  }
  int? id;
  String? subCategoryName;
  int? subCategoryId;
  String? serviceName;
  int? providerId;
  String? name;
  int? price;
  ProductImage? image;
  num? rate;
  int? rateTimes;

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
    map['rate'] = rate;
    map['rate_times'] = rateTimes;
    return map;
  }

}

ProductImage imageFromJson(String str) => ProductImage.fromJson(json.decode(str));
String imageToJson(ProductImage data) => json.encode(data.toJson());
class ProductImage {
  ProductImage({
      this.id, 
      this.path, 
      this.type,});

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