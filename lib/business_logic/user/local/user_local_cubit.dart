import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:productive_families/data/models/user_models/products/user_top_rated_products_model.dart';
import 'package:productive_families/data/models/user_models/profile/user_get_profile_model.dart';
import 'package:productive_families/data/requests/user/products/user_top_rated_products_request.dart';
import 'package:productive_families/data/requests/user/profile/user_get_profile_request.dart';
import '../../../constants/constant_methods.dart';
import '../../../data/models/user_models/profile/user_update_address_model.dart';
import '../../../data/requests/user/profile/user_update_address_request.dart';
part 'user_local_state.dart';

class UserLocalCubit extends Cubit<UserLocalStates> {
  UserLocalCubit() : super(UserLocalInitial());

  static UserLocalCubit get(context) => BlocProvider.of(context);

  UserUpdateAddressModel? updateAddressModel;

  void updateUserLocation({
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


  UserGetProfileModel? userGetProfileModel;

  void getUserProfileData(
  ) async {
    emit(UserGetProfileLoadingState());
    UserGetProfileRequest.userGetProfileRequest()
        .then((value) {
      userGetProfileModel = value;

      if (userGetProfileModel!.status.toString() == '200') {
        emit(UserGetProfileSuccessState());
      }
    }).catchError((error) {
      emit(UserGetProfileErrorState());
      printError(error.toString());
    });
  }




  UserTopRatedProductsModel? userTopRatedProductsModel;

  void getUserTopRatedProducts(
      ) async {
    emit(UserGetTopRatedProductsLoadingState());
    UserTopRatedProductsRequest.userTopRatedProductsRequest()
        .then((value) {
      userTopRatedProductsModel = value;

      if (userTopRatedProductsModel!=null&&userTopRatedProductsModel?.status.toString() == '200') {
        emit(UserGetTopRatedProductsSuccessState());
      }
    }).catchError((error) {
      emit(UserGetTopRatedProductsErrorState());
      printError('getUserTopRatedProducts '+error.toString());
    });
  }




}
