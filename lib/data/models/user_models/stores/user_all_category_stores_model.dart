import 'dart:convert';

import '../../shared_models/shared_classes/image.dart';
UserAllCategoryStoresModel userAllStoresFromJson(String str) => UserAllCategoryStoresModel.fromJson(json.decode(str));
String userAllStoresToJson(UserAllCategoryStoresModel data) => json.encode(data.toJson());
class UserAllCategoryStoresModel {
  // UserAllStores({
  //     this.status,
  //     this.message,
  //     this.stores,});

  UserAllCategoryStoresModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
      stores = [];
      json['stores'].forEach((v) {
        stores.add(Stores.fromJson(v));
      });

  }
  late int status;
 late  String message;
  late List<Stores> stores;
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

Stores storesFromJson(String str) => Stores.fromJson(json.decode(str));
String storesToJson(Stores data) => json.encode(data.toJson());
class Stores {
  // Stores({
  //     this.providerId,
  //     this.serviceName,
  //     this.providerImage,});

  Stores.fromJson(dynamic json) {
    providerId = json['provider_id'];
    serviceName = json['service_name'];
    providerImage = ApiImage.fromJson(json['provider_image']);
  }
  late int providerId;
  late  String serviceName;
  late  ApiImage providerImage;
// Stores copyWith({  int? providerId,
//   String? serviceName,
//   Image? providerImage,
// }) => Stores(  providerId: providerId ?? this.providerId,
//   serviceName: serviceName ?? this.serviceName,
//   providerImage: providerImage ?? this.providerImage,
// );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['provider_id'] = providerId;
    map['service_name'] = serviceName;

      map['provider_image'] = providerImage.toJson();

    return map;
  }

}

