import 'package:dio/dio.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';

class UserStartOrderProcessRequest {
  Future userStartOrderProcessRequest({
    required String address,
    required int lat,
    required int lon,
    required String note,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_START_ORDER_PROCESS,data: {
        'address': address,
        'lat': lat,
        'lon': lon,
        'note': note,
      },token:accessToken );
      printResponse(response.data.toString());
      return false;//UserAddProductToCartModel.fromJson(response.data);
    } catch (error) {
      printError('userStartOrderProcessRequest '+error.toString());
      return null;
    }
  }
}
