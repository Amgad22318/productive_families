import 'dart:convert';

import '../shared_classes/single_and_all_categories_user_store.dart';
UserAllCategoryStoresModel userAllStoresFromJson(String str) => UserAllCategoryStoresModel.fromJson(json.decode(str));
String userAllStoresToJson(UserAllCategoryStoresModel data) => json.encode(data.toJson());
class UserAllCategoryStoresModel {
  // UserAllStores({
  //     this.status,
  //     this.message,
  //     this.stores,});

  UserAllCategoryStoresModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message']??'';
      stores = [];
    if (json['stores']!=null) {
      json['stores'].forEach((v) {
        stores.add(SingleAndAllCategoriesUserStore.fromJson(v));
      });
    }
  }
  late int status;
 late  String message;
  late List<SingleAndAllCategoriesUserStore> stores;
// UserAllStores copyWith({  int? status,
//   String? message,
//   List<Stores>? stores,
// }) => UserAllStores(  status: status ?? this.status,
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



