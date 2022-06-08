import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/constants.dart';
import 'package:productive_families/data/data_provider/local/cache_helper.dart';
import 'package:productive_families/data/models/user_models/auth/user_login_model.dart';
import 'package:productive_families/data/models/shared_models/auth/logout_model.dart';
import 'package:productive_families/data/models/user_models/auth/user_register_confirm_phone_model.dart';
import 'package:productive_families/data/models/user_models/auth/user_register_model.dart';
import 'package:productive_families/data/models/user_models/auth/user_register_resend_confirmation_code_model.dart';
import 'package:productive_families/data/requests/user/auth/user_login_request.dart';
import 'package:productive_families/data/requests/user/auth/user_logout_request.dart';
import 'package:productive_families/data/requests/user/auth/user_register_confirm_phone_request.dart';
import 'package:productive_families/data/requests/user/auth/user_register_request.dart';

import '../../../constants/shared_preferences_keys.dart';
import '../../../data/requests/user/auth/user_register_resend_confirmation_code_request.dart';

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
        accessToken = 'Bearer  ' + userLoginModel!.accessToken!;
        userId = userLoginModel!.user!.id;
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCESS_TOKEN_KEY, value: accessToken);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_USERID_KEY, value: userId);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_USERID_KEY,
            value: userLoginModel?.user?.address.toJson());
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_TYPE_KEY,
            value: userLoginModel?.user?.type);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_NAME_KEY,
            value: userLoginModel?.user?.name);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_PHONE_KEY,
            value: userLoginModel?.user?.phone);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_BALANCE_KEY,
            value: userLoginModel?.user?.balance);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_POINTS_KEY,
            value: userLoginModel?.user?.points);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_IMAGE_KEY,
            value: userLoginModel?.user?.image.path);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_TOTAL_ORDERS_KEY,
            value: userLoginModel?.user?.totalOrders);

        emit(UserLoginSuccessState());
      } else {
        emit(UserLoginErrorState(
            userLoginModel!.message, userLoginModel!.status));
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

  UserRegisterConfirmPhoneModel userRegisterConfirmPhoneModel =
      UserRegisterConfirmPhoneModel();

  void userRegisterConfirmPhone({
    required String phone,
    required String code,
  }) {
    emit(UserRegisterConfirmPhoneLoadingState());
    UserRegisterConfirmPhoneRequest.userRegisterConfirmPhoneRequest(
            phone: phone, code: code)
        .then((value) {
      userRegisterConfirmPhoneModel = value;
      if (value.status == 200) {
        accessToken = 'Bearer  ' + userRegisterConfirmPhoneModel.accessToken;
        userId = userRegisterConfirmPhoneModel.user.id;
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCESS_TOKEN_KEY, value: accessToken);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_USERID_KEY, value: userId);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_TYPE_KEY,
            value: userRegisterConfirmPhoneModel.user.type);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_NAME_KEY,
            value: userRegisterConfirmPhoneModel.user.name);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_PHONE_KEY,
            value: userRegisterConfirmPhoneModel.user.phone);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_BALANCE_KEY,
            value: userRegisterConfirmPhoneModel.user.balance);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_POINTS_KEY,
            value: userRegisterConfirmPhoneModel.user.points);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_IMAGE_KEY,
            value: userRegisterConfirmPhoneModel.user.image.path);
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_ACCOUNT_TOTAL_ORDERS_KEY,
            value: userRegisterConfirmPhoneModel.user.totalOrders);

        emit(UserRegisterConfirmPhoneSuccessState(
            userRegisterConfirmPhoneModel.message));
      } else {
        emit(UserRegisterConfirmPhoneErrorState(
            userRegisterConfirmPhoneModel.message));
      }
    }).catchError((error) {
      printResponse('userRegisterConfirmPhone' + error.toString());
    });
  }

  UserRegisterResendConfirmationCodeModel?
      userRegisterResendConfirmationCodeModel;

  void userRegisterResendConfirmationCode({
    required String phone,
  }) {
    emit(UserRegisterResendConfirmationCodeLoadingState());
    UserRegisterResendConfirmationCode.userRegisterResendConfirmationCode(
            phone: phone)
        .then((value) {
      userRegisterResendConfirmationCodeModel = value;
      if (userRegisterResendConfirmationCodeModel!.status.toString() == '200') {
        emit(UserRegisterResendConfirmationCodeSuccessState());
      } else {
        emit(UserRegisterResendConfirmationCodeErrorState(
            userRegisterResendConfirmationCodeModel!.message));
      }
    }).catchError((error) {
      printResponse('userRegisterResendConfirmationCode' + error.toString());
    });
  }

  LogoutModel? userLogoutModel;

  void userLogout() {
    emit(UserLogoutLoadingState());
    UserLogOutRequest().userLogOutRequest().then((value) {
      userLogoutModel = value;
      if (userLogoutModel != null &&
          userLogoutModel?.status.toString() == '200') {
        emit(UserLogoutSuccessState());
      } else {
        emit(UserLogoutErrorState());
      }
    }).catchError((error) {
      printResponse('userLogout ' + error.toString());
    });
  }
}
