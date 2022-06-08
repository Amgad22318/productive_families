import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/delivery_representative_models/auth/dr_register_model.dart';

class DRRegisterRequest {
  Future dRRegisterRequest({
    required int acceptTerms,
    required String name,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_DR_REGISTER, data: {
        'device_token': 'zee_device',
        'type': 'drivers',
        'accept_terms': acceptTerms,
        'name': name,
        'phone': phone,
        'password': password,
        'password_confirmation': passwordConfirmation,
      });
      printResponse(response.data.toString());
      return DrRegisterModel.fromJson(response.data);
    } catch (error) {
      printError('dRRegisterRequest ' + error.toString());
      return null;
    }
  }
}
