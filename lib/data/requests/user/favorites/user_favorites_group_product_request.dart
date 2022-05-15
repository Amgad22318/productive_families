import 'package:dio/dio.dart';
import 'package:productive_families/data/models/user_models/favorites/user_favorites_group_product_model.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';

class UserFavoriteGroupProductsRequest {
  Future userFavoriteGroupProductsRequest({
    required int page,
    required int groupId,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_FAVORITE_GROUP_PRODUCTS,data: {
        'page': page,
        'group_id': groupId,
      },token:accessToken );
      printResponse(response.data.toString());
      return UserFavoritesGroupProductModel.fromJson(response.data);
    } catch (error) {
      printError('userFavoriteGroupProductsRequest '+error.toString());
      return null;
    }
  }
}
