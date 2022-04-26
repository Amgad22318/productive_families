import 'package:dio/dio.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';

class UserFinishOrderProcessRequest {
  Future userFinishOrderProcessRequest({
    required int orderId,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_FINISH_ORDER_PROCESS,data: {
        'order_id': orderId,
      },token:accessToken );
      printResponse(response.data.toString());
      return false;//UserAddProductToCartModel.fromJson(response.data);
    } catch (error) {
      printError('userFinishOrderProcessRequest '+error.toString());
      return null;
    }
  }
}
