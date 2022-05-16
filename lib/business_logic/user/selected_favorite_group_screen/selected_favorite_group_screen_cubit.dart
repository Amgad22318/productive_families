import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/models/user_models/favorites/user_add_and_remove_product_to_favorites_model.dart';
import 'package:productive_families/data/models/user_models/favorites/user_favorites_group_product_model.dart';
import 'package:productive_families/data/requests/user/favorites/user_favorites_group_product_request.dart';

import '../../../constants/constant_methods.dart';
import '../../../data/requests/user/favorites/user_add_and_remove_product_to_favorites_request.dart';

part 'selected_favorite_group_screen_state.dart';

class SelectedFavoriteGroupScreenCubit
    extends Cubit<SelectedFavoriteGroupScreenState> {
  SelectedFavoriteGroupScreenCubit()
      : super(SelectedFavoriteGroupScreenInitial());

  static SelectedFavoriteGroupScreenCubit get(context) =>
      BlocProvider.of(context);

  UserFavoritesGroupProductModel userFavoritesGroupProductModel =
      UserFavoritesGroupProductModel();

  void getUserFavoritesGroupProduct({
    required int groupId,
  }) async {
    emit(UserGetFavoriteGroupProductLoadingState());
    UserFavoriteGroupProductsRequest()
        .userFavoriteGroupProductsRequest(page: 1, groupId: groupId)
        .then((value) {
      if (value.status == 200) {
        userFavoritesGroupProductModel = value;
        emit(UserGetFavoriteGroupProductSuccessState(
            userFavoritesGroupProductModel.products));
      } else if (value.status == 204) {
        userFavoritesGroupProductModel = value;
        emit(UserGetFavoriteGroupProductEmptyState());
      }
    }).catchError((error) {
      emit(UserGetFavoriteGroupProductErrorState());
      printError('getUserFavoritesGroupProduct ' + error.toString());
    });
  }

  void getUserFavoritesGroupProductLoadMore({
    required int page,
    required int groupId,
  }) async {
    emit(UserGetFavoriteGroupProductLoadingState());
    UserFavoriteGroupProductsRequest()
        .userFavoriteGroupProductsRequest(page: page, groupId: groupId)
        .then((value) {
      if (value.status == 200) {
        userFavoritesGroupProductModel = value;
        emit(UserGetFavoriteGroupProductSuccessState(
            userFavoritesGroupProductModel.products));
      } else if (value.status == 204) {
        userFavoritesGroupProductModel = value;
        emit(UserGetFavoriteGroupProductEmptyState());
      }
    }).catchError((error) {
      emit(UserGetFavoriteGroupProductErrorState());
      printError('getUserFavoritesGroupProduct ' + error.toString());
    });
  }

  UserAddAndRemoveProductToFavoritesModel
      userAddAndRemoveProductToFavoritesModel =
      UserAddAndRemoveProductToFavoritesModel();

  void userFavoritesGroupProductDelete({
    required int groupId,
    required int productId,
    required int index,
  }) async {
    UserAddAndRemoveProductToFavoriteRequest()
        .userAddAndRemoveProductToFavoriteRequest(
            productId: productId, groupId: groupId)
        .then((value) async {
      if (value.status == 200) {
        userAddAndRemoveProductToFavoritesModel = value;
        if( userFavoritesGroupProductModel.products.isEmpty){
          emit(UserGetFavoriteGroupProductEmptyState());
        }
        else if (userFavoritesGroupProductModel.products.isNotEmpty){
          userFavoritesGroupProductModel.products.removeAt(index);
          emit(UserFavoriteGroupProductDeleteSuccessState(
              userAddAndRemoveProductToFavoritesModel.message));
        }


      } else {
        userAddAndRemoveProductToFavoritesModel = value;

        emit(UserFavoriteGroupProductDeleteFailState(
            userAddAndRemoveProductToFavoritesModel.message));
      }
    }).catchError((error) {
      emit(UserFavoriteGroupProductDeleteErrorState());
      printError('userFavoritesGroupProductDelete ' + error.toString());
    });
  }
}
