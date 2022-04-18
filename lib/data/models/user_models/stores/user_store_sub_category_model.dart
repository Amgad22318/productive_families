import 'dart:convert';

import 'package:productive_families/data/models/shared_models/shared_classes/api_image.dart';
UserStoreSubCategoryModel userStoreSubCategoryModelFromJson(String str) => UserStoreSubCategoryModel.fromJson(json.decode(str));
String userStoreSubCategoryModelToJson(UserStoreSubCategoryModel data) => json.encode(data.toJson());
class UserStoreSubCategoryModel {
  // UserStoreSubCategoryModel({
  //     this.status,
  //     this.message,
  //     this.store,});

  UserStoreSubCategoryModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message']??'';
    store = Store.fromJson(json['store']);
  }
  late int status;
  String? message;
  late Store store;
// UserStoreSubCategoryModel copyWith({  int? status,
//   String? message,
//   Store? store,
// }) => UserStoreSubCategoryModel(  status: status ?? this.status,
//   message: message ?? this.message,
//   store: store ?? this.store,
// );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
      map['store'] = store.toJson();
    return map;
  }

}

Store storeFromJson(String str) => Store.fromJson(json.decode(str));
String storeToJson(Store data) => json.encode(data.toJson());
class Store {
  // Store({
  //     this.id,
  //     this.name,
  //     this.subCategories,});

  Store.fromJson(dynamic json) {
    providerId = json['id'];
    providerName = json['name'];
    subCategories = [];
    if (json['sub_categories'] != null) {
      json['sub_categories'].forEach((v) {
        subCategories.add(SubCategories.fromJson(v));
      });
    }
  }
  late  int providerId;
  late  String providerName;
  late List<SubCategories> subCategories;
// Store copyWith({  int? id,
//   String? name,
//   List<SubCategories>? subCategories,
// }) => Store(  id: id ?? this.id,
//   name: name ?? this.name,
//   subCategories: subCategories ?? this.subCategories,
// );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = providerId;
    map['name'] = providerName;
      map['sub_categories'] = subCategories.map((v) => v.toJson()).toList();
    return map;
  }

}

SubCategories subCategoriesFromJson(String str) => SubCategories.fromJson(json.decode(str));
String subCategoriesToJson(SubCategories data) => json.encode(data.toJson());
class SubCategories {
  // SubCategories({
  //     this.id,
  //     this.name,
  //     this.image,});

  SubCategories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image =  ApiImage.fromJson(json['image']);
  }
  late int id;
  late  String name;
  late ApiImage image;
// SubCategories copyWith({  int? id,
//   String? name,
//   Image? image,
// }) => SubCategories(  id: id ?? this.id,
//   name: name ?? this.name,
//   image: image ?? this.image,
// );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
      map['image'] = image.toJson();
    return map;
  }

}

