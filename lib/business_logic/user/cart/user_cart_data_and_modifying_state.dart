part of 'user_cart_data_and_modifying_cubit.dart';

@immutable
abstract class UserCartDataAndModifyingState {}

class UserCartDataAndModifyingInitial extends UserCartDataAndModifyingState {}
///////
class UserGetCartProductLoadingState extends UserCartDataAndModifyingState {}

class UserGetCartProductSuccessState extends UserCartDataAndModifyingState {}

class UserGetCartProductErrorState extends UserCartDataAndModifyingState {}

//////

class UserDeleteFromProductCartLoadingState extends UserCartDataAndModifyingState {}

class UserDeleteFromProductCartSuccessState extends UserCartDataAndModifyingState {}

class UserDeleteFromProductCartErrorState extends UserCartDataAndModifyingState {}

//////


class UserModifyCartProductQuantityLoadingState extends UserCartDataAndModifyingState {}

class UserModifyCartProductQuantitySuccessState extends UserCartDataAndModifyingState {}

class UserModifyCartProductQuantityErrorState extends UserCartDataAndModifyingState {}
