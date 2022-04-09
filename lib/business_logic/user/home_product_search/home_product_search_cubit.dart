import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/models/user_models/search/user_product_search_model.dart';
import 'package:productive_families/data/requests/user/search/user_home_search_request.dart';

import '../../../constants/constant_methods.dart';

part 'home_product_search_state.dart';

class UserProductSearchCubit extends Cubit<UserProductSearchStates> {
  UserProductSearchCubit() : super(HomeProductSearchInitial());

  static UserProductSearchCubit get(context) => BlocProvider.of(context);
  UserProductSearchModel? userProductSearchModel;
  int nextPage = 2;
  bool isLoadingMoreData = false;

  void userProductSearch({
    required String keyWord,
    required int page,
  }) async {
    if (page == 1) {
      nextPage=2;
      emit(UserProductSearchLoadingState());
    } else {
      isLoadingMoreData = true;
    }

    UserProductSearchRequest.userProductSearchRequest(
            keyWord: keyWord, page: page)
        .then((value) {
      if (value.status == 200) {
        if (page == 1) {
          userProductSearchModel = value;
        } else {
          UserProductSearchModel tempUserProductSearchModel = value;
          userProductSearchModel?.products
              ?.addAll(tempUserProductSearchModel.products!);
          isLoadingMoreData = false;

          nextPage+=1;
        }
        emit(UserProductSearchSuccessState());
      } else if (value.status == 204) {
        if (page == 1) {
          emit(UserProductSearchEmptyState());
        }else{
          isLoadingMoreData = false;

        }
      }
    }).catchError((error) {
      emit(UserProductSearchErrorState());
      printError('userProductSearch ' + error.toString());
    });
  }
}
