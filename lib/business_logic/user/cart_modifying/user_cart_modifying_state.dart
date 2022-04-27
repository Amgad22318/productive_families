part of 'user_cart_modifying_cubit.dart';

@immutable
abstract class UserCartModifyingStates {}

class UserCartDataAndModifyingInitial extends UserCartModifyingStates {}


//////

class UserDeleteFromProductCartLoadingState extends UserCartModifyingStates {}

class UserDeleteFromProductCartSuccessState extends UserCartModifyingStates {
  final int index;

  UserDeleteFromProductCartSuccessState(this.index);

}

class UserDeleteFromProductCartErrorState extends UserCartModifyingStates {}

//////



class UserModifyCartProductQuantitySuccessState extends UserCartModifyingStates {
  final int quantity;
  final int cartId;
  UserModifyCartProductQuantitySuccessState({required this.quantity, required this.cartId});
}

class UserModifyCartProductQuantityErrorState extends UserCartModifyingStates {}
