import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/local/cache_helper.dart';
import 'package:productive_families/data/models/user_models/user_login_model.dart';
import 'package:productive_families/data/requests/user/user_login_request.dart';

part 'user_login_state.dart';

class UserLoginCubit extends Cubit<UserLoginStates> {
  UserLoginCubit() : super(UserLoginInitial());

  static UserLoginCubit get(context) => BlocProvider.of(context);

  UserLoginModel? userLoginModel;

  void userLogin({
    required String phone,
    required String password,
  }) {
    emit(UserLoginLoadingState());
    UserLoginRequest.userLoginRequest(password: password, phone: phone)
        .then((value) {
      userLoginModel = value;
      if (userLoginModel!.status.toString() == '200') {
        CacheHelper.saveDataSharedPreference(key: SP_USER_TOKEN, value: userLoginModel?.accessToken);
        emit(UserLoginSuccessState());
      } else {
        emit(UserLoginErrorState(userLoginModel!.message));
      }
    }).catchError((error) {
      printResponse('UserLogin' + error.toString());
    });
  }
}
