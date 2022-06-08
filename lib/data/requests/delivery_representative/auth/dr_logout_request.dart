import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/constants.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import '../../../models/shared_models/auth/logout_model.dart';

class DRLogOutRequest {
  Future dRLogOutRequest(
  ) async {
    try {
      Response response = await DioHelper.postData(url: EP_DR_LOGOUT,token: accessToken);
      printResponse(response.data.toString());
      return LogoutModel.fromJson(response.data);
    } catch (error) {
      printError('dRLogOutRequest ' + error.toString());
      return null;
    }
  }
}
