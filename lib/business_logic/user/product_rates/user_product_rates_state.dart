part of 'user_product_rates_cubit.dart';

@immutable
abstract class UserProductRatesState {}

class UserProductRatesInitial extends UserProductRatesState {}

class UserGetProductRatesLoadingState extends UserProductRatesState {}

class UserGetProductRatesSuccessState extends UserProductRatesState {}

class UserGetProductRatesErrorState extends UserProductRatesState {}
