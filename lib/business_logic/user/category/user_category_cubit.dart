import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/data/models/user_models/category/user_all_categories_model.dart';
import 'package:productive_families/data/requests/user/category/user_all_categories_request.dart';

import 'user_category_state.dart';

class UserCategoryCubit extends Cubit<UserCategoryStates> {
  UserCategoryCubit() : super(UserCategoryInitial());

  static UserCategoryCubit get(context) => BlocProvider.of(context);

  UserAllCategoriesModel? userAllCategoriesModel;

  void getUserAllCategories() async {
    emit(UserGetAllCategoriesLoadingState());
    UserAllCategoriesRequest.userAllCategoriesRequest(page: 1).then((value) {
      if (value.status == 200) {
        userAllCategoriesModel = value;
        emit(UserGetAllCategoriesSuccessState());
      }
    }).catchError((error) {
      emit(UserGetAllCategoriesErrorState());
      printError('getUserAllCategories ' + error.toString());
    });
  }
}
