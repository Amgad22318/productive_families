part of 'user_favorite_state_cubit.dart';

@immutable
abstract class UserFavoriteStateStates {}

class FavoriteStateInitial extends UserFavoriteStateStates {}


class UserFavoriteGroupProductAddOrDeleteSuccessState
    extends UserFavoriteStateStates {
  final String message;
  final int productId;
  final int favoriteGroupCount;

  UserFavoriteGroupProductAddOrDeleteSuccessState(
      {required this.message,required this.productId, required this.favoriteGroupCount});
}

class UserFavoriteGroupProductAddOrDeleteFailState
    extends UserFavoriteStateStates {
  final String message;

  UserFavoriteGroupProductAddOrDeleteFailState(this.message);
}

class UserFavoriteGroupProductAddOrDeleteErrorState
    extends UserFavoriteStateStates {}
