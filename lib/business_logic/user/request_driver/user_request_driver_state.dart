part of 'user_request_driver_cubit.dart';

@immutable
abstract class UserRequestDriverState {}

class UserRequestDriverInitial extends UserRequestDriverState {}

class RequestDriverLoadingState extends UserRequestDriverState {}

class RequestDriverSuccessState extends UserRequestDriverState {
  final String msg;

  RequestDriverSuccessState({required this.msg});
}

class RequestDriverErrorState extends UserRequestDriverState {
  final String msg;
  RequestDriverErrorState({required this.msg});
}

class ConvertPositionToAddressState extends UserRequestDriverState {}
