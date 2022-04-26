import 'dart:convert';

import 'package:productive_families/data/models/shared_models/shared_classes/api_image.dart';
UserShowCartProductsModel userShowCartProductsModelFromJson(String str) => UserShowCartProductsModel.fromJson(json.decode(str));
String userShowCartProductsModelToJson(UserShowCartProductsModel data) => json.encode(data.toJson());
class UserShowCartProductsModel {
  // UserShowCartProductsModel({
  //     this.status,
  //     this.message,
  //     this.products,});

  UserShowCartProductsModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    products = [];
    if (json['products'] != null) {
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }
  late int status;
  String? message;
  List<Products>? products;
// UserShowCartProductsModel copyWith({  int? status,
//   String? message,
//   List<Products>? products,
// }) => UserShowCartProductsModel(  status: status ?? this.status,
//   message: message ?? this.message,
//   products: products ?? this.products,
// );
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
  // Products({
  //     this.cartId,
  //     this.productId,
  //     this.serviceName,
  //     this.description,
  //     this.price,
  //     this.quantity,
  //     this.image,});

  Products.fromJson(dynamic json) {
    cartId = json['cart_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    description = json['description'];
    price = json['price'];
    quantity = json['quantity'];
    image =  ApiImage.fromJson(json['image']) ;
  }
 late int cartId;
 late int productId;
 late String productName;
 late String description;
 late int price;
 late int quantity;
 late ApiImage image;
// Products copyWith({  int? cartId,
//   int? productId,
//   String? serviceName,
//   String? description,
//   int? price,
//   int? quantity,
//   Image? image,
// }) => Products(  cartId: cartId ?? this.cartId,
//   productId: productId ?? this.productId,
//   serviceName: serviceName ?? this.serviceName,
//   description: description ?? this.description,
//   price: price ?? this.price,
//   quantity: quantity ?? this.quantity,
//   image: image ?? this.image,
// );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cart_id'] = cartId;
    map['product_id'] = productId;
    map['service_name'] = productName;
    map['description'] = description;
    map['price'] = price;
    map['quantity'] = quantity;
      map['image'] = image.toJson();
    return map;
  }

}

