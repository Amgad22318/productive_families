import 'package:dio/dio.dart';
import 'package:productive_families/data/models/user_models/favorites/user_add_favorites_group_model.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';

class UserAddFavoriteGroupRequest {
  Future userAddFavoriteGroupRequest({
    required String title,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_ADD_FAVORITE_GROUP,data: {
        'title': title,
      },token:accessToken );
      printResponse(response.data.toString());
      return UserAddFavoritesGroupModel.fromJson(response.data);
    } catch (error) {
      printError('userAddFavoriteGroupRequest '+error.toString());
      return null;
    }
  }
}
