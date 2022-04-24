import 'package:dio/dio.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';

class UserUpdateOrderToLocationRequest {
  Future userUpdateOrderToLocationRequest({
    required String address,
    required int lat,
    required int lon,
    required int orderId,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_UPDATE_ORDER_TO_LOCATION,data: {
        'address': address,
        'lat': lat,
        'lon': lon,
        'order_id': orderId,
      },token:accessToken );
      printResponse(response.data.toString());
      return false;//UserAddProductToCartModel.fromJson(response.data);
    } catch (error) {
      printError('userUpdateOrderToLocationRequest '+error.toString());
      return null;
    }
  }
}
