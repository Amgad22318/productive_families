part of 'user_favorite_bottom_sheet_cubit.dart';

@immutable
abstract class UserFavoriteBottomSheetState {}

class UserFavoriteBottomSheetInitial extends UserFavoriteBottomSheetState {}

class UserGetAllFavoriteGroupsLoadingState
    extends UserFavoriteBottomSheetState {}

class UserGetAllFavoriteGroupsSuccessState
    extends UserFavoriteBottomSheetState {}

class UserGetAllFavoriteGroupsEmptyState
    extends UserFavoriteBottomSheetState {}

class UserGetAllFavoriteGroupsErrorState
    extends UserFavoriteBottomSheetState {}



class UserGetAllFavoriteGroupsSearchLoadingState
    extends UserFavoriteBottomSheetState {}

class UserGetAllFavoriteGroupsSearchSuccessState
    extends UserFavoriteBottomSheetState {}

class UserGetAllFavoriteGroupsSearchEmptyState
    extends UserFavoriteBottomSheetState {}

class UserGetAllFavoriteGroupsSearchErrorState
    extends UserFavoriteBottomSheetState {}





class UserAddFavoriteGroupSuccessState
    extends UserFavoriteBottomSheetState {
  final String message;

  UserAddFavoriteGroupSuccessState(this.message);


}
class UserAddFavoriteGroupFailState
    extends UserFavoriteBottomSheetState {
  final String message;

  UserAddFavoriteGroupFailState(this.message);


}

class UserAddFavoriteGroupErrorState
    extends UserFavoriteBottomSheetState {

}







