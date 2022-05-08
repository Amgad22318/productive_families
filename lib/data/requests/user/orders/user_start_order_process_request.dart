import 'package:dio/dio.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';
import '../../../models/user_models/orders/user_start_order_process_model.dart';

class UserStartOrderProcessRequest {
  Future userStartOrderProcessRequest({
    required String address,
    required num lat,
    required num lon,
    required String note,
    required String userPhone,
    required int? voucherID,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_START_ORDER_PROCESS,data: {
        'address': address,
        'lat': lat,
        'lon': lon,
        'note': note,
        'user_phone': userPhone,
        'voucher_id': voucherID,
      },token:accessToken );
      printResponse(response.data.toString());
      return UserStartOrderProcessModel.fromJson(response.data);
    } catch (error) {
      printError('userStartOrderProcessRequest '+error.toString());
      return null;
    }
  }
}
