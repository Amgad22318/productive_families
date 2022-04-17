import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/user_models/stores/user_all_category_stores_model.dart';


class UserAllCategoriesStoresRequest {
  static Future userAllCategoriesStoresRequest({
    required int page,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_ALL_CATEGORY_STORES,data: {
        'page': page,
      });
      printResponse(response.data.toString());
      return UserAllCategoryStoresModel.fromJson(response.data);
    } catch (error) {
      printError('userAllCategoriesRequest '+error.toString());
      return null;
    }
  }
}
