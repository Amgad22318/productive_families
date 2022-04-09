import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/constants.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/user_models/search/user_product_search_model.dart';
import 'package:productive_families/presentation/screens/user_screens/home/user_home_screen.dart';
import '../../../models/user_models/profile/user_update_address_model.dart';

class UserProductSearchRequest {
  static Future userProductSearchRequest({
    required String keyWord,
    required int page,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_SEARCH_HOME,data: {
        'key_word': keyWord,
        'page': page,
      });
      printResponse(response.data.toString());
      return UserProductSearchModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
