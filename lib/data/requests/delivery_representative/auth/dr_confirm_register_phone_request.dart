import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';

import '../../../models/delivery_representative_models/auth/dr_login_model.dart';

class DRConfirmRegisterPhoneRequest {
  Future dRConfirmRegisterPhoneRequest({
    required String phone,
    required String code,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_DR_CONFIRM_REGISTER_PHONE, data: {
        'type': 'drivers',
        'phone': phone,
        'code': code,
      });
      printResponse(response.data.toString());
      return DRLoginModel.fromJson(response.data);
    } catch (error) {
      printError('dRConfirmRegisterPhoneRequest ' + error.toString());
      return null;
    }
  }
}
