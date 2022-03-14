import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/data/models/user/user_login_model.dart';
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
        emit(UserLoginSuccessState());
      } else {
        emit(UserLoginErrorState(userLoginModel!.message));
      }
    }).catchError((error) {
      printResponse('UserLogin' + error.toString());
    });
  }
}
