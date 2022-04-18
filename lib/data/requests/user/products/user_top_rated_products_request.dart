import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/user_models/products/user_top_rated_products_model.dart';

class UserTopRatedProductsRequest {
  static Future userTopRatedProductsRequest() async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_TOP_RATED_PRODUCT,);
      printResponse(response.data.toString());
      return UserTopRatedProductsModel.fromJson(response.data);
    } catch (error) {
      printError(error.toString());
      return null;
    }
  }
}
