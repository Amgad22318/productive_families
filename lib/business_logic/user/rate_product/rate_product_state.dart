part of 'rate_product_cubit.dart';

@immutable
abstract class RateProductState {}

class RateProductInitial extends RateProductState {}

class UserRateProductLoadingState extends RateProductState {}

class UserRateProductSuccessState extends RateProductState {
  final String msg;

  UserRateProductSuccessState({required this.msg});
}

class UserRateProductErrorState extends RateProductState {
  final String msg;

  UserRateProductErrorState({required this.msg});
}
