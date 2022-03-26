part of 'user_local_cubit.dart';

@immutable
abstract class UserLocalStates {}

class UserLocalInitial extends UserLocalStates {}

class UserUpdateAddressLoadingState extends UserLocalStates {}

class UserUpdateAddressSuccessState extends UserLocalStates {
  final String message;

  UserUpdateAddressSuccessState(this.message);
}

class UserUpdateAddressErrorState extends UserLocalStates {
  final String message;

  UserUpdateAddressErrorState(this.message);
}



class UserGetProfileLoadingState extends UserLocalStates {}

class UserGetProfileSuccessState extends UserLocalStates {}

class UserGetProfileErrorState extends UserLocalStates {}



class UserUpdateProfileLoadingState extends UserLocalStates {}

class UserUpdateProfileSuccessState extends UserLocalStates {}

class UserUpdateProfileErrorState extends UserLocalStates {}
