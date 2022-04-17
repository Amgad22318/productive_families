import 'dart:convert';

import '../shared_classes/user_store.dart';
UserSingleCategoryStoresModel userSingleCategoryStoresModelFromJson(String str) => UserSingleCategoryStoresModel.fromJson(json.decode(str));
String userSingleCategoryStoresModelToJson(UserSingleCategoryStoresModel data) => json.encode(data.toJson());
class UserSingleCategoryStoresModel {
  // UserSingleCategoryStoresModel({
  //     this.status,
  //     this.message,
  //     this.stores,});

  UserSingleCategoryStoresModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message']??'';
      stores = [];
      if (json['stores']!=null) {
        json['stores'].forEach((v) {
          stores.add(Stores.fromJson(v));
        });
      }
  }
  late int status;
  late  String message;
  late List<Stores> stores;
// UserSingleCategoryStoresModel copyWith({  int? status,
//   String? message,
//   List<Stores>? stores,
// }) => UserSingleCategoryStoresModel(  status: status ?? this.status,
//   message: message ?? this.message,
//   stores: stores ?? this.stores,
// );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
      map['stores'] = stores.map((v) => v.toJson()).toList();
    return map;
  }

}



