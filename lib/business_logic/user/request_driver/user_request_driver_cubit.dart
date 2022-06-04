import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/models/user_models/ask_for_driver/user_request_driver_model.dart';
import 'package:productive_families/data/requests/user/ask_for_driver/user_request_driver_request.dart';

import '../../../constants/constant_methods.dart';

part 'user_request_driver_state.dart';

class UserRequestDriverCubit extends Cubit<UserRequestDriverState> {
  UserRequestDriverCubit() : super(UserRequestDriverInitial());

  static UserRequestDriverCubit get(context) =>
      BlocProvider.of<UserRequestDriverCubit>(context);

  final TextEditingController fromLocationController = TextEditingController();

  final TextEditingController toLocationController = TextEditingController();

  late num fromLat;
  late num fromLon;

  void getFromAddress({
    required double lat,
    required double lon,
  }) async {
    fromLat = lat;
    fromLon = lon;
    fromLocationController.text =
        await convertPositionToAddress(lat: lat, lon: lon);
    emit(ConvertPositionToAddressState());
  }

  late num toLat;
  late num toLon;

  void getToAddress({
    required double lat,
    required double lon,
  }) async {
    toLat = lat;
    toLon = lon;
    toLocationController.text =
        await convertPositionToAddress(lat: lat, lon: lon);
    emit(ConvertPositionToAddressState());
  }

  UserRequestDriverModel userRequestDriverModel = UserRequestDriverModel();

  void requestDriver({
    required String? note,
  }) {
    emit(RequestDriverLoadingState());
    UserRequestDriverRequest()
        .userRequestDriverRequest(
            note: note,
            toAddress: toLocationController.text,
            fromAddress: fromLocationController.text,
            toLat: toLat,
            toLon: toLon,
            fromLat: fromLat,
            fromLon: fromLon)
        .then((value) {
      userRequestDriverModel = value;
      if (value.status == 200) {
        emit(RequestDriverSuccessState(msg: userRequestDriverModel.message));
      } else {
        emit(RequestDriverErrorState(msg: userRequestDriverModel.message));
      }
    }).catchError((error) {
      printResponse('requestDriver ' + error.toString());
    });
  }
}
