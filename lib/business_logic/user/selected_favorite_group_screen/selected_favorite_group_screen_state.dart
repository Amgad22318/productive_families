part of 'selected_favorite_group_screen_cubit.dart';

@immutable
abstract class SelectedFavoriteGroupScreenState {}

class SelectedFavoriteGroupScreenInitial extends SelectedFavoriteGroupScreenState {}

class UserGetFavoriteGroupProductLoadingState extends SelectedFavoriteGroupScreenState {}

class UserGetFavoriteGroupProductSuccessState extends SelectedFavoriteGroupScreenState {
  final List<Products> products;
  UserGetFavoriteGroupProductSuccessState(this.products);
}

class UserGetFavoriteGroupProductEmptyState extends SelectedFavoriteGroupScreenState {}

class UserGetFavoriteGroupProductErrorState extends SelectedFavoriteGroupScreenState {}

class UserFavoriteGroupProductDeleteSuccessState extends SelectedFavoriteGroupScreenState {

  final String message;

  UserFavoriteGroupProductDeleteSuccessState(this.message);
}
class UserFavoriteGroupProductDeleteFailState extends SelectedFavoriteGroupScreenState {
  final String message;
  UserFavoriteGroupProductDeleteFailState(this.message);
}
class UserFavoriteGroupProductDeleteErrorState extends SelectedFavoriteGroupScreenState {}
