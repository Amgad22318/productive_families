import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/user_models/stores/user_all_category_stores_model.dart';
import 'package:productive_families/data/models/user_models/stores/user_single_category_stores_model.dart';


class UserSingleCategoryStoresRequest {
  static Future userSingleCategoryStoresRequest({
    required int page,
    required int categoryId,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_SINGLE_CATEGORY_STORES,data: {
        'page': page,
        'category_id': categoryId,
      });
      printResponse(response.data.toString());
      return UserSingleCategoryStoresModel.fromJson(response.data);
    } catch (error) {
      printError('userAllCategoriesRequest '+error.toString());
      return null;
    }
  }
}
