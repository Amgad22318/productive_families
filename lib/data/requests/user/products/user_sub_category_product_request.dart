import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/user_models/products/user_sub_category_product_model.dart';

import '../../../../constants/constants.dart';

class UserSubCategoryProductsRequest {
  Future userSubCategoryProductsRequest({
    required int page,
    required int providerId,
    required int subCategoryId,
    required num? priceFrom,
    required num? priceTo,
    required num? lat,
    required num? lon,
    required String? sortBy,
    required String? filterBy,
  }) async {
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
            if (lat != null) 'lat': lat,
            if (lon != null) 'lon': lon,
          });
      printResponse(response.data.toString());
      return UserSubCategoryProductModel.fromJson(response.data);
    } catch (error) {
      printError('userSubCategoryProductsRequest ' + error.toString());
      return null;
    }
  }
}
