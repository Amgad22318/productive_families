import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/constants/shared_preferences_keys.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/shared_models/shared_classes/api_address.dart';
import 'package:productive_families/data/models/user_models/products/user_sub_category_product_model.dart';

import '../../../../constants/constants.dart';
import '../../../data_provider/local/cache_helper.dart';

class UserSubCategoryProductsRequest {
  Future userSubCategoryProductsRequest({
    required int page,
    required int providerId,
    required int subCategoryId,
    required num? priceFrom,
    required num? priceTo,
    required String? sortBy,
    required String? filterBy,
  }) async {
    String json =
        CacheHelper.getString(key: SharedPreferencesKeys.SP_USER_LOCATION);
    printTest('location : ' + json);
    ApiAddress? userLocation =
        json.isNotEmpty ? ApiAddress.fromJson(jsonDecode(json)) : null;
    try {
      Response response = await DioHelper.postData(
          url: EP_USER_STORE_SUBCATEGORY_PRODUCT,
          data: {
            'page': page,
            'provider_id': providerId,
            'sub_category_id': subCategoryId,
            'user_id': userId,
            if (priceFrom != null) 'price_from': priceFrom,
            if (priceTo != null) 'price_to': priceTo,
            if (sortBy != null) 'sort_by': sortBy,
            if (filterBy != null) 'filter_by': filterBy,
            if (userLocation != null) 'lat': userLocation.lat,
            if (userLocation != null) 'lon': userLocation.lon,
          });
      printResponse(response.data.toString());
      return UserSubCategoryProductModel.fromJson(response.data);
    } catch (error) {
      printError('userSubCategoryProductsRequest ' + error.toString());
      return null;
    }
  }
}
