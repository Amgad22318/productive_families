import 'dart:convert';

UserProductSearchModel homeSearchFromJson(String str) =>
    UserProductSearchModel.fromJson(json.decode(str));

String homeSearchToJson(UserProductSearchModel data) =>
    json.encode(data.toJson());

class UserProductSearchModel {
  UserProductSearchModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message']??'';
    keyWord = json['key_word']??'';

    products = [];
    if (json['products']!=null) {
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }

  late int status;
  late String? message;
  late String? keyWord;
  late List<Products>? products;

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
  Products.fromJson(dynamic json) {
    id = json['id'];
    subCategoryName = json['sub_category_name'];
    subCategoryId = json['sub_category_id'];
    serviceName = json['service_name'];
    providerId = json['provider_id'];
    name = json['name'];
    price = json['price'];
    productImage = json['image'];
    rate = json['rate'];
    rateTimes = json['rate_times'];
  }

  late int id;
  late String subCategoryName;
  late int subCategoryId;
  late String serviceName;
  late int providerId;
  late String name;
  late num price;
  ProductImage? productImage;
  late num rate;
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
    map['image'] = productImage;
    map['rate'] = rate;
    map['rate_times'] = rateTimes;
    return map;
  }
}

class ProductImage {
  ProductImage.fromJson(dynamic json) {
    id = json['id'];
    path = json['path'];
    type = json['type'];
  }

  int? id;
  String? path;
  String? type;
}
