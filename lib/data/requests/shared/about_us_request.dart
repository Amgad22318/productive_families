import 'package:dio/dio.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/shared/about_us_model.dart';
import 'package:productive_families/data/models/shared/terms_model.dart';

class AboutUsRequest {

 static Future getAboutUsRequest() async {

   try {
     Response response = await DioHelper.postData(url: EP_ABOUT_US);
     printResponse(response.data.toString());
     return AboutUsModel.fromJson(response.data);
   } catch (error) {
     printError(error.toString());
     return null;
   }
  }
}
