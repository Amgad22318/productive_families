import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/shared_models/terms_model.dart';

class TermsRequest {

 static Future getTermsRequest() async {

   try {
     Response response = await DioHelper.postData(url: EP_TERMS);
     printResponse(response.data.toString());
     return TermsModel.fromJson(response.data);
   } catch (error) {
     printError(error.toString());
     return null;
   }
  }
}
