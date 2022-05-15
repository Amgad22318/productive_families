import 'package:dio/dio.dart';
import 'package:productive_families/data/models/user_models/favorites/user_all_favorite_groups_model.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';

class UserAllFavoriteGroupsRequest {
  Future userAllFavoriteGroupsRequest({
    required int page,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_ALL_FAVORITE_GROUPS,data: {
        'page': page,
      },token:accessToken );
      printResponse(response.data.toString());
      return UserAllFavoriteGroupsModel.fromJson(response.data);
    } catch (error) {
      printError('userAllFavoriteGroupsRequest '+error.toString());
      return null;
    }
  }
}
