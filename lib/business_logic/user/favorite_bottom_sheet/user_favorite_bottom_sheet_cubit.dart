import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/models/user_models/favorites/user_add_favorites_group_model.dart';
import 'package:productive_families/data/models/user_models/search/user_favorite_groups_search_model.dart';
import 'package:productive_families/data/requests/user/favorites/user_add_favorites_group_request.dart';
import 'package:productive_families/data/requests/user/search/user_favorite_groups_search_request.dart';

import '../../../constants/constant_methods.dart';
import '../../../data/models/user_models/favorites/user_all_favorite_groups_model.dart';
import '../../../data/requests/user/favorites/user_all_favorite_groups_request.dart';

part 'user_favorite_bottom_sheet_state.dart';

class UserFavoriteBottomSheetCubit extends Cubit<UserFavoriteBottomSheetState> {
  UserFavoriteBottomSheetCubit() : super(UserFavoriteBottomSheetInitial());
  static UserFavoriteBottomSheetCubit get(context) => BlocProvider.of(context);
  UserAllFavoriteGroupsModel userAllFavoriteGroupsModel =
  UserAllFavoriteGroupsModel();

  void getAllBottomSheetFavoriteGroups() async {
    emit(UserGetAllFavoriteGroupsLoadingState());
    UserAllFavoriteGroupsRequest()
        .userAllFavoriteGroupsRequest(page: 1)
        .then((value) {
      if (value.status == 200) {
        userAllFavoriteGroupsModel = value;
        emit(UserGetAllFavoriteGroupsSuccessState());
      } else if (value.status == 204) {
        userAllFavoriteGroupsModel = value;
        emit(UserGetAllFavoriteGroupsEmptyState());
      }
    }).catchError((error) {
      emit(UserGetAllFavoriteGroupsErrorState());
      printError('getAllBottomSheetFavoriteGroups ' + error.toString());
    });
  }

  void getAllBottomSheetFavoriteGroupsLoadMore() async {
    emit(UserGetAllFavoriteGroupsLoadingState());
    UserAllFavoriteGroupsRequest()
        .userAllFavoriteGroupsRequest(page: 1)
        .then((value) {
      if (value.status == 200) {
        userAllFavoriteGroupsModel = value;
        emit(UserGetAllFavoriteGroupsSuccessState());
      } else if (value.status == 204) {
        userAllFavoriteGroupsModel = value;
        emit(UserGetAllFavoriteGroupsEmptyState());
      }
    }).catchError((error) {
      emit(UserGetAllFavoriteGroupsErrorState());
      printError('getAllBottomSheetFavoriteGroups ' + error.toString());
    });
  }








  UserFavoriteGroupsSearchModel userFavoriteGroupsSearchModel=UserFavoriteGroupsSearchModel();

  void userGetFavoritesGroupsSearch({
    required String keyWord,
  }) async {
    emit(UserGetAllFavoriteGroupsSearchLoadingState());
    UserFavoriteGroupSearchRequest().userFavoriteGroupSearchRequest(keyWord: keyWord, page: 1)
        .then((value) async {
      if (value.status == 200) {
        userFavoriteGroupsSearchModel = value;
        userAllFavoriteGroupsModel.setGroups=userFavoriteGroupsSearchModel.groups;
        emit(UserGetAllFavoriteGroupsSearchSuccessState());
      } else {
        userFavoriteGroupsSearchModel = value;
        emit(UserGetAllFavoriteGroupsSearchEmptyState());
      }
    }).catchError((error) {
      emit(UserGetAllFavoriteGroupsSearchErrorState());
      printError('userGetFavoritesGroupsSearch ' + error.toString());
    });
  }









  UserAddFavoritesGroupModel userAddFavoritesGroupModel=UserAddFavoritesGroupModel();
  void userAddFavoriteGroup({
    required String title,
  }) async {
    UserAddFavoriteGroupRequest().userAddFavoriteGroupRequest(title: title)
        .then((value) async {
      if (value.status == 200) {
        userAddFavoritesGroupModel = value;
        emit(UserAddFavoriteGroupSuccessState(userAddFavoritesGroupModel.message));
      } else {
        userAddFavoritesGroupModel = value;
        emit(UserAddFavoriteGroupFailState(userAddFavoritesGroupModel.message));
      }
    }).catchError((error) {
      emit(UserAddFavoriteGroupErrorState());
      printError('userAddFavoriteGroup ' + error.toString());
    });
  }
}
