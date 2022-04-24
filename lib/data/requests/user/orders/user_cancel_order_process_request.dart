import 'package:dio/dio.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';

class UserCancelOrderProcessRequest {
  Future userCancelOrderProcessRequest({
    required int orderId,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_CANCEL_ORDER_PROCESS,data: {
        'order_id': orderId,
      },token:accessToken );
      printResponse(response.data.toString());
      return false;//UserAddProductToCartModel.fromJson(response.data);
    } catch (error) {
      printError('userCancelOrderProcessRequest '+error.toString());
      return null;
    }
  }
}
