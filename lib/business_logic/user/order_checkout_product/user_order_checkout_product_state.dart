part of 'user_order_checkout_product_cubit.dart';

@immutable
abstract class UserOrderCheckoutProductState {}

class UserOrderCheckoutProductInitial extends UserOrderCheckoutProductState {}

class UserGetOrderProductCheckoutLoadingState extends UserOrderCheckoutProductState {}

class  UserGetOrderProductCheckoutSuccessState extends UserOrderCheckoutProductState {}

class  UserGetOrderProductCheckoutErrorState extends UserOrderCheckoutProductState {}