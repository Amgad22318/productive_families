import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/data_provider/local/cache_helper.dart';
import 'package:productive_families/data/models/user_models/user_login_model.dart';
import 'package:productive_families/data/models/user_models/user_register_model.dart';
import 'package:productive_families/data/requests/user/user_login_request.dart';
import 'package:productive_families/data/requests/user/user_register_request.dart';

part 'user_auth_state.dart';

class UserAuthCubit extends Cubit<UserAuthStates> {
  UserAuthCubit() : super(UserAuthInitial());

  static UserAuthCubit get(context) => BlocProvider.of(context);
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
        CacheHelper.saveDataToSP(
            key: SP_ACCESS_TOKEN_KEY, value: userLoginModel?.accessToken);
        CacheHelper.saveDataToSP(
            key: SP_ACCOUNT_TYPE_KEY, value: userLoginModel?.user?.type);
        CacheHelper.saveDataToSP(
            key: SP_ACCOUNT_NAME_KEY, value: userLoginModel?.user?.name);
        CacheHelper.saveDataToSP(
            key: SP_ACCOUNT_PHONE_KEY, value: userLoginModel?.user?.phone);
        CacheHelper.saveDataToSP(
            key: SP_ACCOUNT_BALANCE_KEY, value: userLoginModel?.user?.balance);
        CacheHelper.saveDataToSP(
            key: SP_ACCOUNT_POINTS_KEY, value: userLoginModel?.user?.points);
        CacheHelper.saveDataToSP(
            key: SP_ACCOUNT_IMAGE_KEY, value: userLoginModel?.user?.image);
        CacheHelper.saveDataToSP(
            key: SP_ACCOUNT_TOTAL_ORDERS_KEY,
            value: userLoginModel?.user?.totalOrders);
        emit(UserLoginSuccessState());
      } else {
        emit(UserLoginErrorState(userLoginModel!.message));
      }
    }).catchError((error) {
      printResponse('UserLogin' + error.toString());
    });
  }

  UserRegisterModel? userRegisterModel;

  void userRegister({
    required String phone,
    required String name,
    required String password,
    required bool acceptTerms,
  }) {
    emit(UserRegisterLoadingState());
    UserRegisterRequest.userRegisterRequest(
            password: password,
            phone: phone,
            acceptTerms: acceptTerms,
            name: name)
        .then((value) {
      userRegisterModel = value;
      if (userRegisterModel!.status.toString() == '200') {
        emit(UserRegisterSuccessState());
      } else {
        emit(UserRegisterErrorState(userRegisterModel!.message));
      }
    }).catchError((error) {
      printResponse('userRegister' + error.toString());
    });
  }
}
