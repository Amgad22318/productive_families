import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/constant_methods.dart';
import '../../../constants/shared_preferences_keys.dart';
import '../../../data/data_provider/local/cache_helper.dart';
import '../../../data/models/shared_models/shared_classes/api_address.dart';
import '../../../data/models/user_models/profile/user_update_address_model.dart';
import '../../../data/requests/user/profile/user_update_address_request.dart';

part 'update_user_location_state.dart';

class UpdateUserLocationCubit extends Cubit<UpdateUserLocationState> {
  UpdateUserLocationCubit() : super(UpdateUserLocationInitial());
  static UpdateUserLocationCubit get(context) => BlocProvider.of(context);
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
    emit(UserUpdateAddressLoadingState());
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
        emit(UserUpdateAddressSuccessState(updateAddressModel.message));
      } else {
        updateAddressModel = value;
        emit(UserUpdateAddressErrorState(updateAddressModel.message));
      }
    }).catchError((error) {
      printError('updateUserLocation ' + error.toString());
    });
  }
}
