import 'package:dio/dio.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';

class UserShowOrderRequest {
  Future userShowOrderRequest({
    required int page,
    required int orderId,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_SHOW_ORDER,data: {
        'page': page,
        'order_id': orderId,
      },token:accessToken );
      printResponse(response.data.toString());
      return false;//UserAddProductToCartModel.fromJson(response.data);
    } catch (error) {
      printError('userShowOrderRequest '+error.toString());
      return null;
    }
  }
}
