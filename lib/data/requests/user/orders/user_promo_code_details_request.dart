import 'package:dio/dio.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';
import '../../../models/user_models/orders/user_promo_code_details_model.dart';

class UserPromoCodeDetailsRequest {
  Future userPromoCodeDetailsRequest({
    required String code,

  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_PROMO_CODE_DETAILS,data: {
        'code': code,
      },token:accessToken );
      printResponse(response.data.toString());
      return UserPromoCodeDetailsModel.fromJson(response.data);
    } catch (error) {
      printError('userPromoCodeDetailsRequest '+error.toString());
      return null;
    }
  }
}
