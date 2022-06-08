import 'dart:convert';

import '../../shared_models/shared_classes/api_image.dart';
import '../../shared_models/shared_classes/api_review.dart';

UserShowProductModel userShowProductModelFromJson(String str) =>
    UserShowProductModel.fromJson(json.decode(str));

String userShowProductModelToJson(UserShowProductModel data) =>
    json.encode(data.toJson());

class UserShowProductModel {
  // UserShowProductModel({
  //   this.status,
  //   this.message,
  //   this.product,
  // });

  UserShowProductModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  late int status;
  late String message;
  Product? product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    return map;
  }
}

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  // Product({
  //   this.id,
  //   this.name,
  //   this.description,
  //   this.price,
  //   this.images,
  //   this.favorite,
  //   this.rate,
  //   this.rateTimes,
  //   this.rates,
  // });

  Product.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    if (json['images'] != null) {
      productImages = [];
      json['images'].forEach((v) {
        productImages.add(ApiImage.fromJson(v));
      });
    }
    favorite = json['favorite'];
    rate = json['rate'];
    rateTimes = json['rate_times'];

    rates = [];
    json['rates'].forEach((v) {
      rates.add(ApiReview.fromJson(v));
    });
  }

  late int id;
  late String name;
  late String description;
  late num price;
  late List<ApiImage> productImages;
  late int favorite;
  late num rate;
  late int rateTimes;
  late List<ApiReview> rates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['images'] = productImages.map((v) => v.toJson()).toList();

    map['favorite'] = favorite;
    map['rate'] = rate;
    map['rate_times'] = rateTimes;

    map['rates'] = rates.map((v) => v.toJson()).toList();

    return map;
  }
}
