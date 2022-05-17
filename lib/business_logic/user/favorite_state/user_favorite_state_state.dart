part of 'user_favorite_state_cubit.dart';

@immutable
abstract class UserFavoriteStateStates {}

class FavoriteStateInitial extends UserFavoriteStateStates {}


class UserFavoriteGroupProductAddOrDeleteSuccessState
    extends UserFavoriteStateStates {
  final String message;
  final int productId;

  UserFavoriteGroupProductAddOrDeleteSuccessState(this.message, this.productId);
}

class UserFavoriteGroupProductAddOrDeleteFailState
    extends UserFavoriteStateStates {
  final String message;

  UserFavoriteGroupProductAddOrDeleteFailState(this.message);
}

class UserFavoriteGroupProductAddOrDeleteErrorState
    extends UserFavoriteStateStates {}
