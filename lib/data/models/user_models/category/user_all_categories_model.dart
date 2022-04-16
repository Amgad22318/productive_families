import 'dart:convert';

import '../../shared_models/shared_classes/image.dart';
UserAllCategoriesModel userAllCategoriesModelFromJson(String str) => UserAllCategoriesModel.fromJson(json.decode(str));
String userAllCategoriesModelToJson(UserAllCategoriesModel data) => json.encode(data.toJson());
class UserAllCategoriesModel {
  // UserAllCategoriesModel({
  //     this.status,
  //     this.message,
  //     this.categories,});

  UserAllCategoriesModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<Categories>? categories;

// UserAllCategoriesModel copyWith({  int? status,
//   String? message,
//   List<Categories>? categories,
// }) => UserAllCategoriesModel(  status: status ?? this.status,
//   message: message ?? this.message,
//   categories: categories ?? this.categories,
// );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));
String categoriesToJson(Categories data) => json.encode(data.toJson());
class Categories {
  // Categories({
  //     this.id,
  //     this.name,
  //     this.image,});

  Categories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    categoryImage = json['image'] != null ? Image.fromJson(json['image']) : null;
  }
  int? id;
  String? name;
  Image? categoryImage;
// Categories copyWith({  int? id,
//   String? name,
//   Image? image,
// }) => Categories(  id: id ?? this.id,
//   name: name ?? this.name,
//   image: image ?? this.image,
// );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (categoryImage != null) {
      map['image'] = categoryImage?.toJson();
    }
    return map;
  }

}

