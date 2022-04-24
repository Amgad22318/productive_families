import 'package:dio/dio.dart';
import 'package:productive_families/data/models/user_models/orders/user_show_cart_products_model.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';

class UserShowCartProductsRequest {
  Future userShowCartProductsRequest({
    required int page,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_SHOW_CART_PRODUCTS,data: {
        'page': page,
      },token:accessToken );
      printResponse(response.data.toString());
      return UserShowCartProductsModel.fromJson(response.data);
    } catch (error) {
      printError('userShowCartProductsRequest '+error.toString());
      return null;
    }
  }
}