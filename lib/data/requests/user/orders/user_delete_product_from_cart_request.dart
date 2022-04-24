import 'package:dio/dio.dart';
import 'package:productive_families/data/models/user_models/orders/user_delete_product_from_cart_model.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';

class UserDeleteProductFromCartRequest {
  Future userDeleteProductFromCartRequest({
    required int cartId,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_DELETE_PRODUCT_FROM_CART,data: {
        'cart_id': cartId,
      },token:accessToken );
      printResponse(response.data.toString());
      return UserDeleteProductFromCartModel.fromJson(response.data);
    } catch (error) {
      printError('userDeleteProductFromCartRequest '+error.toString());
      return null;
    }
  }
}