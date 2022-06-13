import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/constants.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/delivery_representative_models/profile/dr_show_model.dart';

class DRShowRequest {
  Future dRShowRequest(
  ) async {
    try {
      Response response = await DioHelper.postData(url: EP_DR_SHOW,token: accessToken);
      printResponse(response.data.toString());
      return DrShowModel.fromJson(response.data);
    } catch (error) {
      printError('dRShowRequest ' + error.toString());
      return null;
    }
  }
}