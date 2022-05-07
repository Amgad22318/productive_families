import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/models/user_models/orders/user_promo_code_details_model.dart';
import 'package:productive_families/data/models/user_models/orders/user_start_order_process_model.dart';
import 'package:productive_families/data/requests/user/orders/user_start_order_process_request.dart';

import '../../../constants/constant_methods.dart';
import '../../../data/requests/user/orders/user_promo_code_details_request.dart';

part 'user_start_order_process_and__order_location_state.dart';

class UserStartOrderProcessAndOrderLocationCubit
    extends Cubit<UserStartOrderProcessAndOrderLocationState> {
  UserStartOrderProcessAndOrderLocationCubit()
      : super(UserStartOrderProcessAndOrderLocationInitial());

  static UserStartOrderProcessAndOrderLocationCubit get(context) =>
      BlocProvider.of(context);

  final TextEditingController locationController = TextEditingController();

  late String convertedAddress;
  late num lat;
  late num lon;

  void getAddress({
    required double lat,
    required double lon,
  }) async {
    this.lat=lat;
    this.lon=lon;
    convertedAddress=await convertPositionToAddress(lat: lat, lon: lon);
    locationController.text=convertedAddress;
    emit(ConvertPositionToAddressState());
  }



  late UserStartOrderProcessModel userStartOrderProcessModel;

  void userStartOrderProcess({
    required String address,
    required num lat,
    required num lon,
    required String note,
    required String userPhone,
    required int voucherID,
  }) async {
    emit(UserStartOrderProcessLoadingState());
    UserStartOrderProcessRequest()
        .userStartOrderProcessRequest(
            address: address,
            lat: lat,
            lon: lon,
            note: note,
            userPhone: userPhone,
            voucherID: voucherID)
        .then((value) {
      if (value.status == 200) {
        userStartOrderProcessModel = value;
        emit(UserStartOrderProcessSuccessState(
            userStartOrderProcessModel.message));
      }
    }).catchError((error) {
      emit(UserStartOrderProcessErrorState());
      printError('userStartOrderProcess ' + error.toString());
    });
  }





  late UserPromoCodeDetailsModel userPromoCodeDetailsModel;

  void userPromoCodeCheck({
    required String code,
  }) async {
    UserPromoCodeDetailsRequest()
        .userPromoCodeDetailsRequest(code: code)
        .then((value) {
      if (value.status == 200) {
        userPromoCodeDetailsModel = value;
        emit(UserPromoCodeSuccessState(
            userPromoCodeDetailsModel.message));
      }
      else if (value.status == 400) {
        userPromoCodeDetailsModel = value;
        emit(UserWrongPromoCodeState(
            userPromoCodeDetailsModel.message));
      }
    }).catchError((error) {
      emit(UserPromoCodeErrorState());
      printError('userPromoCodeCheck ' + error.toString());
    });
  }
}
