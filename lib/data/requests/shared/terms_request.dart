import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/remote/dio_helper.dart';
import 'package:productive_families/data/models/shared/terms_model.dart';

class TermsRequest {

  Future getTermsRequest() async {
    await DioHelper.postData(
      url: EP_TERMS,
    ).then((value) {
      printResponse(value.data.toString());
      return TermsModel.fromJson(value.data);
    }).catchError((error){
      printError(error.toString());
    });
  }
}
