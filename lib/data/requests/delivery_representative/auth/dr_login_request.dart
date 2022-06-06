import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';

import '../../../models/delivery_representative_models/auth/dr_login_model.dart';

class DRLoginRequest {
  Future dRLoginRequest({
    required String phone,
    required String password,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_DR_LOGIN, data: {
        'device_token': 'zee_device',
        'type': 'drivers',
        'phone': phone,
        'password': password,
      });
      printResponse(response.data.toString());
      return DRLoginModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
