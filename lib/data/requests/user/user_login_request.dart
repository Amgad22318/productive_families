import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/shared/about_us_model.dart';

class UserLoginRequest {
  static Future userLoginRequest({
    required String phone,
    required String password,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_LOGIN, data: {
        'device_token': 'zee_device',
        'type': 'users',
        'phone': phone,
        'password': password,
      });
      printResponse(response.data.toString());
      return AboutUsModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
