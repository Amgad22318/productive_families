part of 'user_auth_cubit.dart';

@immutable
abstract class UserAuthStates {}

class UserAuthInitial extends UserAuthStates {}

class UserLoginLoadingState extends UserAuthStates {}

class UserLoginSuccessState extends UserAuthStates {}

class UserLoginErrorState extends UserAuthStates {
  final String message;

  UserLoginErrorState(this.message);
}






class UserRegisterLoadingState extends UserAuthStates {}

class UserRegisterSuccessState extends UserAuthStates {}

class UserRegisterErrorState extends UserAuthStates {
  final String message;

  UserRegisterErrorState(this.message);
}
