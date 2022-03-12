import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/models/shared/terms_model.dart';
import 'package:productive_families/data/requests/shared/terms_request.dart';

part 'all_app_setting_state.dart';

class AllAppSettingCubit extends Cubit<AllAppSettingStates> {
  AllAppSettingCubit() : super(AllAppSettingInitial());

  static AllAppSettingCubit get(context) => BlocProvider.of(context);

  TermsModel? terms;

  void getTerms() {
    emit(GetAppTermsLoadingState());
    TermsRequest().getTermsRequest().then((value) {
      terms=value;
      if (terms!.status.toString() == '200') {
        emit(GetAppTermsSuccessState());
      } else {
        emit(GetAppTermsErrorState());
      }
    }) ;
  }
}
