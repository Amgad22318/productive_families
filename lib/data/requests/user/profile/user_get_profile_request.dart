import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/constants.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/user_models/profile/user_get_profile_model.dart';

class UserGetProfileRequest {
  static Future userGetProfileRequest() async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_PROFILE_SHOW,token:'Bearer  $accessToken');
      printResponse(response.data.toString());
      return UserGetProfileModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
