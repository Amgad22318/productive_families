import 'package:dio/dio.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';
import '../../../models/user_models/orders/user_modify_cart_product_quantity_model.dart';

class UserModifyProductQuantityCartRequest {
  Future userModifyProductQuantityCartRequest({
    required int cartId,
    required int quantity,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_MODIFY_CART_PRODUCT_QUANTITY,data: {
        'cart_id': cartId,
        'quantity': quantity,
      },token:accessToken );
      printResponse(response.data.toString());
      return UserModifyCartProductQuantityModel.fromJson(response.data);
    } catch (error) {
      printError('userModifyProductQuantityCartRequest '+error.toString());
      return null;
    }
  }
}