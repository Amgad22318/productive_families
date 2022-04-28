part of 'user_show_order_cubit.dart';

@immutable
abstract class UserShowOrderState {}

class UserShowOrderInitial extends UserShowOrderState {}

class UserShowOrderLoadingState extends UserShowOrderState {}
class UserShowOrderSuccessState extends UserShowOrderState {}
class UserShowOrderErrorState extends UserShowOrderState {}
