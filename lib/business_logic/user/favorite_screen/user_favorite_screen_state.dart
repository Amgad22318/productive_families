part of 'user_favorite_screen_cubit.dart';

@immutable
abstract class UserFavoriteScreenState {}

class UserFavoriteScreenInitial extends UserFavoriteScreenState {}

class UserGetAllFavoriteScreenGroupsLoadingState extends UserFavoriteScreenState {}

class UserGetAllFavoriteScreenGroupsSuccessState extends UserFavoriteScreenState {
  final List<Groups> groups;
  UserGetAllFavoriteScreenGroupsSuccessState(this.groups);
}
class UserGetAllFavoriteScreenGroupsEmptyState extends UserFavoriteScreenState {}

class UserGetAllFavoriteScreenGroupsErrorState extends UserFavoriteScreenState {}
