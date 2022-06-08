import 'dart:convert';

import 'package:productive_families/data/models/shared_models/shared_classes/api_review.dart';

import 'api_image.dart';

ApiProduct productFromJson(String str) => ApiProduct.fromJson(json.decode(str));
String productToJson(ApiProduct data) => json.encode(data.toJson());

class ApiProduct {
  ApiProduct({
    int? id,
    String? name,
    String? description,
    num? price,
    List<ApiImage>? images,
    ApiImage? image,
    int? favorite,
    num? rate,
    int? rateTimes,
    List<ApiReview>? rates,
    String? subCategoryName,
    int? subCategoryId,
    String? serviceName,
    int? providerId,
    String? providerName,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _price = price;
    _images = images;
    _image = image;
    _favorite = favorite;
    _rate = rate;
    _rateTimes = rateTimes;
    _rates = rates;

    _subCategoryName = subCategoryName;
    _subCategoryId = subCategoryId;
    _serviceName = serviceName;
    _providerId = providerId;
    _providerName = providerName;
  }

  ApiProduct.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _image = json['image'] != null ? ApiImage.fromJson(json['image']) : null;
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(ApiImage.fromJson(v));
      });
    }
    _favorite = json['favorite'];
    _rate = json['rate'];
    _rateTimes = json['rate_times'];
    if (json['rates'] != null) {
      _rates = [];
      json['rates'].forEach((v) {
        _rates?.add(ApiReview.fromJson(v));
      });
    }

    _subCategoryName = json['sub_category_name'];
    _subCategoryId = json['sub_category_id'];
    _serviceName = json['service_name'];
    _providerId = json['provider_id'];
    _providerName = json['provider_name'];
  }
  int? _id;
  String? _name;
  String? _description;
  num? _price;
  List<ApiImage>? _images;
  ApiImage? _image;
  int? _favorite;
  num? _rate;
  int? _rateTimes;
  List<ApiReview>? _rates;
  String? _subCategoryName;
  int? _subCategoryId;
  String? _serviceName;
  int? _providerId;
  String? _providerName;

  int get id => _id ?? 0;
  String get name => _name ?? "";
  String get description => _description ?? "";
  num get price => _price ?? 0;
  List<ApiImage> get images => _images ?? [];
  ApiImage get image => _image ?? ApiImage();
  int get favorite => _favorite ?? 0;

  set setFavorite(int value) {
    _favorite = value;
  }

  num get rate => _rate ?? 0;
  int get rateTimes => _rateTimes ?? 0;
  List<ApiReview> get rates => _rates ?? [];
  String get subCategoryName => _subCategoryName ?? "";
  int get subCategoryId => _subCategoryId ?? 0;
  String get serviceName => _serviceName ?? "";
  int get providerId => _providerId ?? 0;
  String get providerName => _providerName ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['price'] = _price;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    map['image'] = _image;
    map['favorite'] = _favorite;
    map['rate'] = _rate;
    map['rate_times'] = _rateTimes;
    if (_rates != null) {
      map['rates'] = _rates?.map((v) => v.toJson()).toList();
    }
    map['sub_category_name'] = _subCategoryName;
    map['sub_category_id'] = _subCategoryId;
    map['service_name'] = _serviceName;
    map['provider_id'] = _providerId;
    map['provider_name'] = _providerName;
    return map;
  }
}
