import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/user_models/orders/user_add_product_to_cart_model.dart';

import '../../../../constants/constants.dart';

class UserAddProductToCartRequest {
   Future userAddProductToCartRequest({
    required int productId,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_ADD_PRODUCT_TO_CART,data: {
        'product_id': productId,
      },token:accessToken );
      printResponse(response.data.toString());
      return UserAddProductToCartModel.fromJson(response.data);
    } catch (error) {
      printError('userAddProductToCartRequest '+error.toString());
      return null;
    }
  }
}
