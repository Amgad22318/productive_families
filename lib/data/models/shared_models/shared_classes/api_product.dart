import 'dart:convert';

import 'api_image.dart';

ApiProduct productsFromJson(String str) =>
    ApiProduct.fromJson(json.decode(str));
String productsToJson(ApiProduct data) => json.encode(data.toJson());

class ApiProduct {
  ApiProduct({
    int? id,
    String? subCategoryName,
    int? subCategoryId,
    String? serviceName,
    int? providerId,
    String? name,
    num? price,
    ApiImage? image,
    int? favorite,
    num? rate,
    int? rateTimes,
  }) {
    _id = id;
    _subCategoryName = subCategoryName;
    _subCategoryId = subCategoryId;
    _serviceName = serviceName;
    _providerId = providerId;
    _name = name;
    _price = price;
    _image = image;
    _favorite = favorite;
    _rate = rate;
    _rateTimes = rateTimes;
  }

  ApiProduct.fromJson(dynamic json) {
    _id = json['id'];
    _subCategoryName = json['sub_category_name'];
    _subCategoryId = json['sub_category_id'];
    _serviceName = json['service_name'];
    _providerId = json['provider_id'];
    _name = json['name'];
    _price = json['price'];
    _image = json['image'] != null ? ApiImage.fromJson(json['image']) : null;
    _favorite = json['favorite'];
    _rate = json['rate'];
    _rateTimes = json['rate_times'];
  }
  int? _id;
  String? _subCategoryName;
  int? _subCategoryId;
  String? _serviceName;
  int? _providerId;
  String? _name;
  num? _price;
  ApiImage? _image;
  int? _favorite;
  num? _rate;
  int? _rateTimes;

  int get id => _id ?? 0;
  String get subCategoryName => _subCategoryName ?? "";
  int get subCategoryId => _subCategoryId ?? 0;
  String get serviceName => _serviceName ?? "";
  int get providerId => _providerId ?? 0;
  String get name => _name ?? "";
  num get price => _price ?? 0;
  ApiImage get image => _image ?? ApiImage();
  int get favorite => _favorite ?? 0;

  set setFavorite(int value) {
    _favorite = value;
  }

  num get rate => _rate ?? 0;
  int get rateTimes => _rateTimes ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['sub_category_name'] = _subCategoryName;
    map['sub_category_id'] = _subCategoryId;
    map['service_name'] = _serviceName;
    map['provider_id'] = _providerId;
    map['name'] = _name;
    map['price'] = _price;
    if (_image != null) {
      map['image'] = _image?.toJson();
    }
    map['favorite'] = _favorite;
    map['rate'] = _rate;
    map['rate_times'] = _rateTimes;
    return map;
  }
}
