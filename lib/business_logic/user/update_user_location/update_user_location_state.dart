part of 'update_user_location_cubit.dart';

@immutable
abstract class UpdateUserLocationState {}

class UpdateUserLocationInitial extends UpdateUserLocationState {}
class ConvertPositionToAddressState extends UpdateUserLocationState {}
class UserUpdateAddressLoadingState extends UpdateUserLocationState {}

class UserUpdateAddressSuccessState extends UpdateUserLocationState {
  final String message;

  UserUpdateAddressSuccessState(this.message);
}

class UserUpdateAddressErrorState extends UpdateUserLocationState {
  final String message;

  UserUpdateAddressErrorState(this.message);
}