import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';

import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/user_models/category/user_all_categories_model.dart';


class UserAllCategoriesRequest {



  static Future userAllCategoriesRequest({
    required int page,
  }) async {
    try {

      Response response = await DioHelper.postData(url: EP_USER_ALL_CATEGORIES,data: {
        'page': page,
      });
      printResponse(response.data.toString());
      return UserAllCategoriesModel.fromJson(response.data);
    } catch (error) {
      printError('userAllCategoriesRequest '+error.toString());
      return null;
    }
  }
}
