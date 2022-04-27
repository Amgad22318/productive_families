part of 'user_all_orders_cubit.dart';

@immutable
abstract class UserAllOrdersState {}

class UserAllOrdersInitial extends UserAllOrdersState {}

class UserGetAllOrdersLoadingState extends UserAllOrdersState {}
class UserGetAllOrdersSuccessState extends UserAllOrdersState {}
class UserGetAllOrdersEmptyState extends UserAllOrdersState {}
class UserGetAllOrdersErrorState extends UserAllOrdersState {}