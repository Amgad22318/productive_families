import 'dart:convert';

import '../../shared_models/shared_classes/api_image.dart';

SingleAndAllCategoriesUserStore storesFromJson(String str) => SingleAndAllCategoriesUserStore.fromJson(json.decode(str));
String storesToJson(SingleAndAllCategoriesUserStore data) => json.encode(data.toJson());
class SingleAndAllCategoriesUserStore {
  // Stores({
  //     this.providerId,
  //     this.serviceName,
  //     this.providerImage,});

  SingleAndAllCategoriesUserStore.fromJson(dynamic json) {
    providerId = json['provider_id'];
    serviceName = json['service_name'];
    providerName = json['provider_name'];
    providerImage = ApiImage.fromJson(json['provider_image']);
  }
  late int providerId;
  late  String serviceName;
  late  String providerName;
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
    map['provider_name'] = providerName;
    map['provider_image'] = providerImage.toJson();
    return map;
  }

}