import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/constants.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import '../../../models/user_models/profile/user_update_address_model.dart';

class UserUpdateAddressRequest {
   Future userUpdateAddressRequest({
    required double lat,
    required double lon,
    required String address,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_PROFILE_UPDATE_ADDRESS,token:accessToken,data: {
        'lat': lat,
        'lon': lon,
        'address': address,
      });
      printResponse(response.data.toString());
      return UserUpdateAddressModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
