import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/constants.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/user_models/profile/user_get_profile_model.dart';
import 'package:productive_families/data/models/user_models/profile/user_update_profile.dart';

class UserUpdateProfileRequest {
  static Future userUpdateProfileRequest(
  {
    required String phone,
    required String name,
    required String image,
}
      ) async {

    try {
      Response response = await DioHelper.postData(url: EP_USER_PROFILE_UPDATE,token:'Bearer  $accessToken',data: {
        'image':image??'',
        'phone': phone,
        'name': name,
      });
      printResponse(response.data.toString());
      return UserUpdateProfile.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
