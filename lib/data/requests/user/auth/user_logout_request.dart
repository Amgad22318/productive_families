import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/constants.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/user_models/auth/user_login_model.dart';

import '../../../models/user_models/auth/user_logout_model.dart';

class UserLogOutRequest {
  static Future userLogOutRequest(
  ) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_LOGOUT,token: 'Bearer  $accessToken');
      printResponse(response.data.toString());
      return UserLogoutModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
