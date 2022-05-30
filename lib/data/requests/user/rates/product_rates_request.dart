import 'package:dio/dio.dart';
import 'package:productive_families/data/models/user_models/rates/user_rate_product_model.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';
import '../../../models/user_models/rates/product_rates_model.dart';

class ProductRatesRequest {
  Future productRatesRequest({
    required int productId,
    required int page,
  }) async {
    try {
      Response response = await DioHelper.postData(
          url: EP_USER_PRODUCT_RATES,
          data: {
            'page': page,
            'product_id': productId,
          },
          token: accessToken);
      printResponse(response.data.toString());
      return ProductRatesModel.fromJson(response.data);
    } catch (error) {
      printError('productRatesRequest ' + error.toString());
      return null;
    }
  }
}
