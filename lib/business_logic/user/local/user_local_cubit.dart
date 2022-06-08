import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive_families/data/models/shared_models/shared_classes/api_address.dart';
import 'package:productive_families/data/models/user_models/products/user_top_rated_products_model.dart';
import 'package:productive_families/data/requests/user/products/user_top_rated_products_request.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/shared_preferences_keys.dart';
import '../../../data/data_provider/local/cache_helper.dart';
import '../../../data/models/shared_models/shared_classes/api_address.dart';
import '../../../data/models/user_models/profile/user_update_address_model.dart';
import '../../../data/requests/user/profile/user_update_address_request.dart';

part 'user_local_state.dart';

class UserLocalCubit extends Cubit<UserLocalStates> {
  UserLocalCubit() : super(UserLocalInitial());

  static UserLocalCubit get(context) => BlocProvider.of(context);
  final TextEditingController userLocationController = TextEditingController();

  UserUpdateAddressModel updateAddressModel = UserUpdateAddressModel();

  late num lat;
  late num lon;

  void getAddress({
    required double lat,
    required double lon,
  }) async {
    this.lat = lat;
    this.lon = lon;
    userLocationController.text =
        await convertPositionToAddress(lat: lat, lon: lon);
    emit(ConvertPositionToAddressState());
  }

  void updateUserLocation({
    required double lat,
    required double lon,
    required String address,
  }) async {
    emit(UserUpdateAddressFirstTimeLoadingState());
    UserUpdateAddressRequest()
        .userUpdateAddressRequest(lat: lat, lon: lon, address: address)
        .then((value) {
      if (value.status == 200) {
        updateAddressModel = value;
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_USER_LOCATION,
            value: jsonEncode(
                ApiAddress(lat: lat, lon: lon, address: address).toJson()));
        CacheHelper.saveDataToSP(
            key: SharedPreferencesKeys.SP_LOCATION_PICKED, value: true);
        emit(
            UserUpdateAddressFirstTimeSuccessState(updateAddressModel.message));
      }
    }).catchError((error) {
      emit(UserUpdateAddressFirstTimeErrorState(updateAddressModel.message));
      printError(error.toString());
    });
  }

  UserTopRatedProductsModel? userTopRatedProductsModel;

  void getUserTopRatedProducts() async {
    emit(UserGetTopRatedProductsLoadingState());
    UserTopRatedProductsRequest.userTopRatedProductsRequest().then((value) {
      userTopRatedProductsModel = value;

      if (userTopRatedProductsModel != null &&
          userTopRatedProductsModel?.status.toString() == '200') {
        emit(UserGetTopRatedProductsSuccessState());
      }
    }).catchError((error) {
      emit(UserGetTopRatedProductsErrorState());
      printError('getUserTopRatedProducts ' + error.toString());
    });
  }
}
