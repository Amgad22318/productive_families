import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/models/user_models/rates/product_rates_model.dart';
import 'package:productive_families/data/requests/user/rates/product_rates_request.dart';

import '../../../constants/constant_methods.dart';

part 'user_product_rates_state.dart';

class UserProductRatesCubit extends Cubit<UserProductRatesState> {
  UserProductRatesCubit() : super(UserProductRatesInitial());

  static UserProductRatesCubit get(context) =>
      BlocProvider.of<UserProductRatesCubit>(context);

  ProductRatesModel productRatesModel = ProductRatesModel();
  int currentPage = 2;
  bool isLoadingMoreData = false;

  void getProductRates({
    required int productId,
  }) {
    emit(UserGetProductRatesLoadingState());
    ProductRatesRequest()
        .productRatesRequest(productId: productId, page: 1)
        .then((value) {
      productRatesModel = value;
      if (value.status == 200) {
        emit(UserGetProductRatesSuccessState());
      } else {
        emit(UserGetProductRatesErrorState());
      }
    }).catchError((error) {
      emit(UserGetProductRatesErrorState());
      printResponse('getProductRates ' + error.toString());
    });
  }

  void getProductRatesLoadMore({
    required int productId,
    required int page,
  }) {
    if (currentPage > productRatesModel.pageCount || isLoadingMoreData) {
      return;
    }
    isLoadingMoreData = true;
    ProductRatesRequest()
        .productRatesRequest(productId: productId, page: currentPage)
        .then((value) {
      ProductRatesModel productRatesTempModel = ProductRatesModel();
      productRatesTempModel = value;
      if (value.status == 200) {
        productRatesModel.reviews.addAll(productRatesTempModel.reviews);
        currentPage++;
        emit(UserGetProductRatesSuccessState());
        isLoadingMoreData = false;
      } else {
        emit(UserGetProductRatesErrorState());
      }
    }).catchError((error) {
      emit(UserGetProductRatesErrorState());
      printResponse('getProductRates ' + error.toString());
    });
  }
}
