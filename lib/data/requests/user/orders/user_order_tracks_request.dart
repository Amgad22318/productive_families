import 'package:dio/dio.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';
import '../../../models/user_models/orders/user_order_tracks_model.dart';

class UserOrderTracksRequest {
  Future userOrderTracksRequest({
    required int orderId,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_ORDER_TRACKS,data: {
        'order_id': orderId,
      },token:accessToken );
      printResponse(response.data.toString());
      return UserOrderTracksModel.fromJson(response.data);
    } catch (error) {
      printError('userOrderTracksRequest '+error.toString());
      return null;
    }
  }
}
