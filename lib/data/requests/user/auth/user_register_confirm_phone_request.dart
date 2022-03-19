import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/user_models/auth/user_register_confirm_phone_model.dart';

class UserRegisterConfirmPhoneRequest {
  static Future userRegisterConfirmPhoneRequest({
    required String phone,
    required String code,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_REGISTER_CONFIRM_PHONE, data: {
        'type': 'users',
        'phone': phone,
        'code': code,
      });
      printResponse(response.data.toString());
      return UserRegisterConfirmPhoneModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
