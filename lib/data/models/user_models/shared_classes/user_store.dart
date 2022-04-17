import 'dart:convert';

import 'api_image.dart';

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