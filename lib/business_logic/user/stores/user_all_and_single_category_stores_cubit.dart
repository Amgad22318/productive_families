import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/models/user_models/stores/user_all_category_stores_model.dart';
import 'package:productive_families/data/models/user_models/stores/user_single_category_stores_model.dart';
import 'package:productive_families/data/requests/user/stores/user_all_category_stores_request.dart';
import 'package:productive_families/data/requests/user/stores/user_single_category_stores_request.dart';

import '../../../constants/constant_methods.dart';

part 'user_all_and_single_category_stores_state.dart';

class UserAllAndSingleCategoryStoresCubit
    extends Cubit<UserAllAndSingleCategoryStoresStates> {
  UserAllAndSingleCategoryStoresCubit()
      : super(AllAndSingleCategoryStoresInitial());

  static UserAllAndSingleCategoryStoresCubit get(context) =>
      BlocProvider.of(context);

  int selectedCategoryIndex = 0;

  void changeSelectedCategoryIndex({required int index}) {
    selectedCategoryIndex = index;
    emit(UserChangeSelectedCategoryIndexState(selectedCategoryIndex));
  }

  UserAllCategoryStoresModel? userAllCategoryStoresModel;

  void getUserAllCategoriesStores() async {
    emit(UserGetStoresLoadingState());
    UserAllCategoriesStoresRequest.userAllCategoriesStoresRequest(page: 1)
        .then((value) {
      if (value.status == 200) {
        userAllCategoryStoresModel = value;
        emit(UserGetAllCategoriesStoresSuccessState());
      }
    }).catchError((error) {
      emit(UserGetAllCategoriesStoresErrorState());
      printError('getUserAllCategoriesStores ' + error.toString());
    });
  }

  void getUserAllCategoriesStoresLoadMore({
    required int page,
  }) async {
    emit(UserGetStoresLoadingState());
    UserAllCategoriesStoresRequest.userAllCategoriesStoresRequest(page: page)
        .then((value) {
      if (value.status == 200) {
        userAllCategoryStoresModel = value;
        emit(UserGetAllCategoriesStoresSuccessState());
      }
    }).catchError((error) {
      emit(UserGetAllCategoriesStoresErrorState());
      printError('getUserAllCategoriesStoresLoadMore ' + error.toString());
    });
  }
  /////////////////////////////

  UserSingleCategoryStoresModel? userSingleCategoryStoresModel;
  void getUserSingleCategoriesStores({required int categoryId}) async {
    emit(UserGetStoresLoadingState());
    UserSingleCategoryStoresRequest.userSingleCategoryStoresRequest(page: 1,categoryId: categoryId)
        .then((value) {
      if (value.status == 200) {
        userSingleCategoryStoresModel = value;
        emit(UserGetSingleCategoriesStoresSuccessState());
      }
    }).catchError((error) {
      emit(UserGetSingleCategoriesStoresErrorState());
      printError('getUserSingleCategoriesStores ' + error.toString());
    });
  }
}
