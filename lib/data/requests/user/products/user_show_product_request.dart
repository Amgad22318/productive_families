import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/user_models/products/user_show_product_model.dart';

class UserShowProductsRequest {
  static Future userShowProductsRequest({required int productId}) async {
    try {
      Response response = await DioHelper.postData(
          url: EP_USER_SHOW_PRODUCT, data: {'product_id': productId});
      printResponse(response.data.toString());
      return UserShowProductModel.fromJson(response.data);
    } catch (error) {
      printError('userShowProductsRequest '+error.toString());
      return null;
    }
  }
}
