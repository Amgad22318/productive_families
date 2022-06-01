part of 'rate_product_cubit.dart';

@immutable
abstract class UserRateProductState {}

class RateProductInitial extends UserRateProductState {}

class UserRateProductLoadingState extends UserRateProductState {}

class UserRateProductSuccessState extends UserRateProductState {
  final String msg;

  UserRateProductSuccessState({required this.msg});
}

class UserRateProductErrorState extends UserRateProductState {
  final String msg;

  UserRateProductErrorState({required this.msg});
}
