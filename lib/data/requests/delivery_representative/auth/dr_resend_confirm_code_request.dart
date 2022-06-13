import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import '../../../models/delivery_representative_models/auth/dr_resend_confirm_code_model.dart';

class DRResendConfirmCodeRequest {
  Future dRResendConfirmCodeRequest({
    required String phone,
  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_DR_RESEND_CONFIRM_CODE, data: {
        'phone': phone,
      });
      printResponse(response.data.toString());
      return DrResendConfirmCodeModel.fromJson(response.data);
    } catch (error) {
      printError('dRResendConfirmCodeRequest ' + error.toString());
      return null;
    }
  }
}
