part of 'user_cart_get_data_cubit.dart';

@immutable
abstract class UserCartGetDataState {}

class UserCartGetDataInitial extends UserCartGetDataState {}
///////
class UserGetCartProductLoadingState extends UserCartGetDataState {}

class UserGetCartProductSuccessState extends UserCartGetDataState {}
class UserGetCartProductEmptyState extends UserCartGetDataState {}
class UserCartItemRemovedState extends UserCartGetDataState {}

class UserGetCartProductErrorState extends UserCartGetDataState {}