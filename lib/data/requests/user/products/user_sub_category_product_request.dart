import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/user_models/products/user_sub_category_product_model.dart';


class UserSubCategoryProductsRequest {
  static Future userSubCategoryProductsRequest({
    required int page,
    required int providerId,
    required int subCategoryId,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_STORE_SUBCATEGORY_PRODUCT,data: {
        'page': page,
        'provider_id': providerId,
        'sub_category_id': subCategoryId,
      });
      printResponse(response.data.toString());
      return UserSubCategoryProductModel.fromJson(response.data);
    } catch (error) {
      printError('userSubCategoryProductsRequest '+error.toString());
      return null;
    }
  }
}
