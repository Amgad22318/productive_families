import 'package:dio/dio.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';
import '../../../models/user_models/favorites/user_add_and_remove_product_to_favorites_model.dart';

class UserAddAndRemoveProductToFavoriteRequest {
  Future userAddAndRemoveProductToFavoriteRequest({
    required int productId,
    required int groupId,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_ADD_PRODUCT_TO_FAVORITE,data: {
        'product_id': productId,
        'group_id': groupId,
      },token:accessToken );
      printResponse(response.data.toString());
      return UserAddAndRemoveProductToFavoritesModel.fromJson(response.data);
    } catch (error) {
      printError('userAddAndRemoveProductToFavoriteRequest '+error.toString());
      return null;
    }
  }
}
