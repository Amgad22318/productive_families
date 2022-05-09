import 'package:dio/dio.dart';
import 'package:productive_families/data/models/user_models/orders/user_order_show_check_out_products_model.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';

class UserOrderShowCheckoutProductsRequest {
  Future userOrderShowCheckoutProductsRequest({
    required int page,
    required int orderId,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_ORDER_SHOW_CHECKOUT_PRODUCTS,data: {
        'order_id': orderId,
        'page': page,
      },token:accessToken );
      printResponse(response.data.toString());
      return UserOrderShowCheckOutProductsModel.fromJson(response.data);
    } catch (error) {
      printError('userOrderShowCheckoutProductsRequest '+error.toString());
      return null;
    }
  }
}
