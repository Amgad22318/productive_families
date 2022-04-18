import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/models/user_models/stores/user_store_sub_category_model.dart';
import 'package:productive_families/data/requests/user/stores/user_store_sub_category_request.dart';

import '../../../constants/constant_methods.dart';

part 'user_store_sub_category_state.dart';

class UserStoreSubCategoryCubit extends Cubit<UserStoreSubCategoryStates> {
  UserStoreSubCategoryCubit() : super(StoreSubCategoryInitial());

  static UserStoreSubCategoryCubit get(context) => BlocProvider.of(context);

  UserStoreSubCategoryModel? userStoreSubCategoryModel;

  void getStoreSubCategory({
    required int providerId,
  }) async {
    emit(UserGetStoreSubCategoryLoadingState());
    UserStoreSubCategoryRequest.userStoreSubCategoryRequest(
            page: 1, providerId: providerId)
        .then((value) {
        if (value.status == 200) {
          userStoreSubCategoryModel = value;
          emit(UserGetStoreSubCategorySuccessState());
        }

    }).catchError((error) {

      emit(UserGetStoreSubCategoryErrorState());
      printError('getStoreSubCategory ' + error.toString());
    });
  }

  void getStoreSubCategoryLoadMore({
    required int providerId,
    required int page,
  }) async {
    emit(UserGetStoreSubCategoryLoadingState());
    UserStoreSubCategoryRequest.userStoreSubCategoryRequest(
        page: page, providerId: providerId)
        .then((value) {
      if (value.status == 200) {
        userStoreSubCategoryModel = value;

        emit(UserGetStoreSubCategorySuccessState());
      }
    }).catchError((error) {
      emit(UserGetStoreSubCategoryErrorState());
      printError('getStoreSubCategory ' + error.toString());
    });
  }

}
