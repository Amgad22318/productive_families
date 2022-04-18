import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/user_models/stores/user_store_sub_category_model.dart';


class UserStoreSubCategoryRequest {
  static Future userStoreSubCategoryRequest({
    required int page,
    required int providerId,
  }) async {

    try {
      Response response = await DioHelper.postData(url: EP_USER_STORE_SUBCATEGORY,data: {
        'page': page,
        'provider_id': providerId,
      });
      printResponse(response.data.toString());
      printTest(response.data.status.toString());
      return UserStoreSubCategoryModel.fromJson(response.data);
    } catch (error) {
      printError('userStoreSubCategoryRequest '+error.toString());
      return null;
    }
  }
}
