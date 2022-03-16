import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/user_models/auth/user_register_resend_confirmation_code_model.dart';

class UserRegisterResendConfirmationCode {
  static Future userRegisterResendConfirmationCode({
    required String phone,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_REGISTER_RESEND_CONFIRMATION_CODE, data: {
        'phone': phone,
      });
      printResponse(response.data.toString());
      return UserRegisterResendConfirmationCodeModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
