import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/models/user_models/products/user_sub_category_product_model.dart';
import 'package:productive_families/data/requests/user/products/user_sub_category_product_request.dart';

import '../../../constants/constant_methods.dart';

part 'user_sub_category_product_state.dart';

class UserSubCategoryProductCubit extends Cubit<UserSubCategoryProductStates> {
  UserSubCategoryProductCubit() : super(UserSubCategoryProductInitial());

  static UserSubCategoryProductCubit get(context) => BlocProvider.of(context);

  UserSubCategoryProductModel? userSubCategoryProductModel;

  void getSubCategoryProduct({
    required int providerId,
    required int subCategoryId,
  }) async {
    emit(UserGetSubCategoryProductLoadingState());
    UserSubCategoryProductsRequest.userSubCategoryProductsRequest(
        page: 1, providerId: providerId,subCategoryId: subCategoryId)
        .then((value) {
      if (value.status == 200) {
        userSubCategoryProductModel = value;
        emit(UserGetSubCategoryProductSuccessState());
      }

    }).catchError((error) {

      emit(UserGetSubCategoryProductErrorState());
      printError('getStoreSubCategory ' + error.toString());
    });
  }



  void getSubCategoryProductLoadMore({
    required int providerId,
    required int subCategoryId,
  }) async {
    emit(UserGetSubCategoryProductLoadingState());
    UserSubCategoryProductsRequest.userSubCategoryProductsRequest(
        page: 1, providerId: providerId,subCategoryId: subCategoryId)
        .then((value) {
      if (value.status == 200) {
        userSubCategoryProductModel = value;
        emit(UserGetSubCategoryProductSuccessState());
      }

    }).catchError((error) {

      emit(UserGetSubCategoryProductErrorState());
      printError('getStoreSubCategory ' + error.toString());
    });
  }


}
