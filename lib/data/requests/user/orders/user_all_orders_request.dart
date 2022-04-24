import 'package:dio/dio.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';

class UserAllOrdersRequest {
  Future userAllOrdersRequest({
    required int page,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_ALL_ORDERS,data: {
        'page': page,
      },token:accessToken );
      printResponse(response.data.toString());
      return false;//UserAddProductToCartModel.fromJson(response.data);
    } catch (error) {
      printError('userAllOrdersRequest '+error.toString());
      return null;
    }
  }
}
