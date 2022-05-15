import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/constants.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/user_models/profile/user_update_profile_model.dart';

class UserUpdateProfileRequest {
   Future userUpdateProfileRequest(
  {
    required String? phone,
    required String? name,
    required XFile? image,
    required int mode,
}
      ) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_PROFILE_UPDATE,token:accessToken,data: {
        'image':image==null?null:await multipartConvertImage(image: image),
        'phone': phone,
        'name': name,
        'mode': mode,
      },formData: true);
      printResponse(response.data.toString());
      return UserUpdateProfileModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
