import 'package:dio/dio.dart';
import 'package:productive_families/data/models/user_models/ask_for_driver/user_request_driver_model.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';

class UserRequestDriverRequest {
  Future userRequestDriverRequest({
    required String? note,
    required String toAddress,
    required String fromAddress,
    required num toLat,
    required num toLon,
    required num fromLat,
    required num fromLon,
  }) async {
    try {
      Response response = await DioHelper.postData(
          url: EP_USER_REQUEST_DRIVER,
          data: {
            'to_address': toAddress,
            'to_lat': toLat,
            'to_lon': toLon,
            'from_address': fromAddress,
            'from_lat': fromLat,
            'from_lon': fromLon,
            if (note != null) 'note': note,
          },
          token: accessToken);
      printResponse(response.data.toString());
      return UserRequestDriverModel.fromJson(response.data);
    } catch (error) {
      printError('userRequestDriverRequest ' + error.toString());
      return null;
    }
  }
}
