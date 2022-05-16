import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/models/user_models/favorites/user_all_favorite_groups_model.dart';
import 'package:productive_families/data/requests/user/favorites/user_all_favorite_groups_request.dart';

import '../../../constants/constant_methods.dart';

part 'user_favorite_screen_state.dart';

class UserFavoriteScreenCubit extends Cubit<UserFavoriteScreenState> {
  UserFavoriteScreenCubit() : super(UserFavoriteScreenInitial());

  static UserFavoriteScreenCubit get(context) => BlocProvider.of(context);
  UserAllFavoriteGroupsModel userAllFavoriteGroupsModel =
      UserAllFavoriteGroupsModel();

  void getAllFavoriteScreenGroups() async {
    emit(UserGetAllFavoriteScreenGroupsLoadingState());
    UserAllFavoriteGroupsRequest()
        .userAllFavoriteGroupsRequest(page: 1)
        .then((value) {
      if (value.status == 200) {
        userAllFavoriteGroupsModel = value;
        emit(UserGetAllFavoriteScreenGroupsSuccessState(userAllFavoriteGroupsModel.groups));
      } else if (value.status == 204) {
        userAllFavoriteGroupsModel = value;
        emit(UserGetAllFavoriteScreenGroupsEmptyState());
      }
    }).catchError((error) {
      emit(UserGetAllFavoriteScreenGroupsErrorState());
      printError('getAllFavoriteScreenGroups ' + error.toString());
    });
  }

  void getAllFavoriteScreenGroupsLoadMore() async {
    emit(UserGetAllFavoriteScreenGroupsLoadingState());
    UserAllFavoriteGroupsRequest()
        .userAllFavoriteGroupsRequest(page: 1)
        .then((value) {
      if (value.status == 200) {
        userAllFavoriteGroupsModel = value;
        emit(UserGetAllFavoriteScreenGroupsSuccessState(userAllFavoriteGroupsModel.groups));
      } else if (value.status == 204) {
        userAllFavoriteGroupsModel = value;
        emit(UserGetAllFavoriteScreenGroupsEmptyState());
      }
    }).catchError((error) {
      emit(UserGetAllFavoriteScreenGroupsErrorState());
      printError('getAllFavoriteScreenGroups ' + error.toString());
    });
  }
}
