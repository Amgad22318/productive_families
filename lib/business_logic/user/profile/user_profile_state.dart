part of 'user_profile_cubit.dart';

@immutable
abstract class UserProfileState {}

class UserProfileInitial extends UserProfileState {}


class UserGetProfileLoadingState extends UserProfileState {}

class UserGetProfileSuccessState extends UserProfileState {

}
class UserGetProfileErrorState extends UserProfileState {}



class UserUpdateProfileLoadingState extends UserProfileState {}

class UserUpdateProfileSuccessState extends UserProfileState {
  final String message;

  UserUpdateProfileSuccessState(this.message);
}

class UserUpdateProfileErrorState extends UserProfileState {
  final String message;

  UserUpdateProfileErrorState(this.message);
}
