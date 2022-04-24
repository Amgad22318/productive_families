part of 'user_add_product_to_cart_cubit.dart';

@immutable
abstract class UserAddProductToCartStates {}

class UserAddProductToCartInitial extends UserAddProductToCartStates {
}
class UserAddProductToCartLoadingState extends UserAddProductToCartStates {}

class UserAddProductToCartSuccessState extends UserAddProductToCartStates {
  final String message;
  UserAddProductToCartSuccessState(this.message);
}
class UserAddProductToCartWrongProviderState extends UserAddProductToCartStates {
  final String message;
  UserAddProductToCartWrongProviderState(this.message);
}

class UserAddProductToCartErrorState extends UserAddProductToCartStates {}

