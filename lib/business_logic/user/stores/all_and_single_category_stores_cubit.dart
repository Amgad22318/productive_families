import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/models/user_models/stores/user_all_category_stores_model.dart';
import 'package:productive_families/data/requests/user/stores/user_all_category_stores_request.dart';

import '../../../constants/constant_methods.dart';

part 'all_and_single_category_stores_state.dart';

class AllAndSingleCategoryStoresCubit
    extends Cubit<AllAndSingleCategoryStoresStates> {
  AllAndSingleCategoryStoresCubit()
      : super(AllAndSingleCategoryStoresInitial());

  static AllAndSingleCategoryStoresCubit get(context) =>
      BlocProvider.of(context);

  int selectedCategoryIndex = 0;

  void changeSelectedCategoryIndex({required int index}) {
    selectedCategoryIndex = index;
    emit(UserChangeSelectedCategoryIndexState(selectedCategoryIndex));
  }

  UserAllCategoryStoresModel? userAllCategoryStoresModel;

  void getUserAllCategoriesStores() async {
    emit(UserGetAllCategoriesStoresLoadingState());
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
    emit(UserGetAllCategoriesStoresLoadingState());
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
}
