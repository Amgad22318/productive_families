import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:meta/meta.dart';

import '../../../constants/constant_methods.dart';
import '../../../data/models/user_models/profile/user_update_address_model.dart';
import '../../../data/requests/user/profile/user_update_address_request.dart';

part 'user_local_state.dart';

class UserLocalCubit extends Cubit<UserLocalStates> {
  UserLocalCubit() : super(UserLocalInitial());

  static UserLocalCubit get(context) => BlocProvider.of(context);

  UserUpdateAddressModel? updateAddressModel;


  Future<void> updateUserLocation({
    required double lat,
    required double lon,
    required String address,
  }) async {
    emit(UserUpdateAddressLoadingState());
    UserUpdateAddressRequest.userUpdateAddressRequest(
            lat: lat, lon: lon, address: address)
        .then((value) {
      updateAddressModel = value;

      if (updateAddressModel!.status.toString() == '200') {
        emit(UserUpdateAddressSuccessState(updateAddressModel!.message!));
      }
    }).catchError((error) {
      emit(UserUpdateAddressErrorState(updateAddressModel!.message!));
      printError(error.toString());
    });
  }



}
