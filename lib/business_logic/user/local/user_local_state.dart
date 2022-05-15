part of 'user_local_cubit.dart';

@immutable
abstract class UserLocalStates {}

class UserLocalInitial extends UserLocalStates {}

class UserUpdateAddressFirstTimeLoadingState extends UserLocalStates {}

class UserUpdateAddressFirstTimeSuccessState extends UserLocalStates {
  final String message;

  UserUpdateAddressFirstTimeSuccessState(this.message);
}

class UserUpdateAddressFirstTimeErrorState extends UserLocalStates {
  final String message;

  UserUpdateAddressFirstTimeErrorState(this.message);
}








class UserGetTopRatedProductsLoadingState extends UserLocalStates {}

class UserGetTopRatedProductsSuccessState extends UserLocalStates {}

class UserGetTopRatedProductsErrorState extends UserLocalStates {}
class ConvertPositionToAddressState extends UserLocalStates {}

