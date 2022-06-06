import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/models/user_models/products/user_sub_category_product_model.dart';
import 'package:productive_families/data/requests/user/products/user_sub_category_product_request.dart';

import '../../../constants/constant_methods.dart';

part 'user_sub_category_product_state.dart';

class UserSubCategoryProductCubit extends Cubit<UserSubCategoryProductStates> {
  UserSubCategoryProductCubit() : super(UserSubCategoryProductInitial());

  static UserSubCategoryProductCubit get(context) => BlocProvider.of(context);

  int? priceFrom;
  int? priceTo;
  num? lat;
  num? lon;
  String? sortBy;
  String? filterBy;
  late int providerId;
  late int subCategoryId;

  void setProviderAndSubCategoryId({
    required int providerId,
    required int subCategoryId,
  }) {
    this.providerId = providerId;
    this.subCategoryId = subCategoryId;
  }

  UserSubCategoryProductModel userSubCategoryProductModel =
      UserSubCategoryProductModel();

  void getSubCategoryProduct() async {
    emit(UserGetSubCategoryProductLoadingState());
    UserSubCategoryProductsRequest()
        .userSubCategoryProductsRequest(
            page: 1,
            providerId: providerId,
            subCategoryId: subCategoryId,
            priceFrom: priceFrom,
            priceTo: priceTo,
            lat: lat,
            lon: lon,
            sortBy: sortBy,
            filterBy: filterBy)
        .then((value) {
      if (value.status == 200) {
        userSubCategoryProductModel = value;
        emit(UserGetSubCategoryProductSuccessState());
      } else if (value.status == 204) {
        emit(UserGetSubCategoryProductEmptyState());
      }
    }).catchError((error) {
      emit(UserGetSubCategoryProductErrorState());
      printError('getStoreSubCategory ' + error.toString());
    });
  }
}
