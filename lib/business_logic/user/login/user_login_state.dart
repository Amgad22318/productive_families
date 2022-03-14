part of 'user_login_cubit.dart';

@immutable
abstract class UserLoginStates {}

class UserLoginInitial extends UserLoginStates {}

class UserLoginLoadingState extends UserLoginStates{}
class UserLoginSuccessState extends UserLoginStates{
}
class UserLoginErrorState extends UserLoginStates{
 final String message;

  UserLoginErrorState(this.message);


}
