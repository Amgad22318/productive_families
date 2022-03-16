part of 'user_auth_cubit.dart';

@immutable
abstract class UserAuthStates {}

class UserAuthInitial extends UserAuthStates {}

class UserLoginLoadingState extends UserAuthStates {}

class UserLoginSuccessState extends UserAuthStates {}

class UserLoginErrorState extends UserAuthStates {
  final String? message;

  UserLoginErrorState(this.message);
}






class UserRegisterLoadingState extends UserAuthStates {}

class UserRegisterSuccessState extends UserAuthStates {}

class UserRegisterErrorState extends UserAuthStates {
  final String? message;

  UserRegisterErrorState(this.message);
}



class UserRegisterConfirmPhoneLoadingState extends UserAuthStates {}

class UserRegisterConfirmPhoneSuccessState extends UserAuthStates {
  final String? message;

  UserRegisterConfirmPhoneSuccessState(this.message);

}

class UserRegisterConfirmPhoneErrorState extends UserAuthStates {
  final String? message;

  UserRegisterConfirmPhoneErrorState(this.message);
}


class UserRegisterResendConfirmationCodeLoadingState extends UserAuthStates {}

class UserRegisterResendConfirmationCodeSuccessState extends UserAuthStates {}

class UserRegisterResendConfirmationCodeErrorState extends UserAuthStates {
  final String? message;

  UserRegisterResendConfirmationCodeErrorState(this.message);
}
