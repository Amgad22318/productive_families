import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/data/models/shared_models/about_us_model.dart';
import 'package:productive_families/data/models/shared_models/terms_model.dart';

import 'package:productive_families/data/requests/shared/about_us_request.dart';
import 'package:productive_families/data/requests/shared/terms_request.dart';

part 'all_app_setting_state.dart';

class AllAppSettingCubit extends Cubit<AllAppSettingStates> {
  AllAppSettingCubit() : super(AllAppSettingInitial());

  static AllAppSettingCubit get(context) => BlocProvider.of(context);

  TermsModel? terms;

  void getTerms() {
    emit(GetTermsLoadingState());
    TermsRequest.getTermsRequest().then((value) {
      terms = value;
      if (terms!.status.toString() == '200') {
        emit(GetTermsSuccessState());
      } else {

        emit(GetTermsErrorState());
      }
    }).catchError((error) {
      printResponse('getTerms' + error.toString());
    });
  }

  AboutUsModel? aboutUs;

  void getAboutUs() {
    emit(GetAboutUsLoadingState());
    AboutUsRequest.getAboutUsRequest().then((value) {
      aboutUs = value;
      if (aboutUs!.status.toString() == '200') {
        emit(GetAboutUsSuccessState());
      } else {
        emit(GetAboutUsErrorState());
      }
    }).catchError((error) {
      printResponse('getAboutUs' + error.toString());
    });
  }
}
