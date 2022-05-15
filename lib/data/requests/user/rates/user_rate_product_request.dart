import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:productive_families/data/models/user_models/rates/user_rate_product_model.dart';

import '../../../../constants/constant_methods.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/end_points.dart';
import '../../../data_provider/remote/dio_helper.dart';

class UserRateProductRequest {
  Future userRateProductRequest({
    required String comment,
    required int productId,
    required int rate,
    required XFile? image,

  }) async {
    try {
      Response response = await DioHelper.postData(url: EP_USER_RATE_PRODUCT,data: {
        'comment': comment,
        'product_id': productId,
        'rate': rate,
        'image': image==null?null:await multipartConvertImage(image: image),
      },token:accessToken );
      printResponse(response.data.toString());
      return UserRateProductModel.fromJson(response.data);
    } catch (error) {
      printError('userRateProductRequest '+error.toString());
      return null;
    }
  }
}
