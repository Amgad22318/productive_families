import 'package:dio/dio.dart';
import 'package:productive_families/data/models/user_models/search/user_favorite_groups_search_model.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';

class UserFavoriteGroupSearchRequest {
  Future userFavoriteGroupSearchRequest({
    required String keyWord,
    required int page,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_SEARCH_FAVORITE_GROUP,data: {
        'key_word': keyWord,
        'page': page,
      },token:accessToken );
      printResponse(response.data.toString());
      return UserFavoriteGroupsSearchModel.fromJson(response.data);
    } catch (error) {
      printError('userFavoriteGroupSearchRequest '+error.toString());
      return null;
    }
  }
}
