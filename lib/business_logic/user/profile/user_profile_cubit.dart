import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:productive_families/data/requests/user/profile/user_update_profile_request.dart';
import '../../../constants/constant_methods.dart';
import '../../../data/models/user_models/profile/user_get_profile_model.dart';
import '../../../data/models/user_models/profile/user_update_profile_model.dart';
import '../../../data/requests/user/profile/user_get_profile_request.dart';
part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileInitial());
  static UserProfileCubit get(context) => BlocProvider.of(context);
  final TextEditingController userLocationController = TextEditingController();
  UserGetProfileModel userGetProfileModel=UserGetProfileModel();

  void getUserProfileData(
      ) async {
    emit(UserGetProfileLoadingState());
    UserGetProfileRequest().userGetProfileRequest()
        .then((value) {

      if (value.status == 200) {
        userGetProfileModel = value;
        emit(UserGetProfileSuccessState());
      }
    }).catchError((error) {
      emit(UserGetProfileErrorState());
      printError(error.toString());
    });
  }
UserUpdateProfileModel updateProfileModel=UserUpdateProfileModel();

  void updateUserProfile({
    required String? phone,
    required String? name,
    required XFile? image,
    required int mode,

  }
      ) async {
    
    if (mode==0) {
      emit(UserUpdateProfileLoadingState());
    }
    UserUpdateProfileRequest().userUpdateProfileRequest(phone: phone, name: name, image: image, mode: mode)
        .then((value) {
      if (value.status == 200) {
        updateProfileModel = value;
        userGetProfileModel.setAccount=updateProfileModel.account;
        emit(UserUpdateProfileSuccessState(updateProfileModel.message));
      }
      else{
        updateProfileModel = value;

        emit(UserUpdateProfileErrorState(updateProfileModel.message));
      }
    }).catchError((error) {
      printError(error.toString());
    });
  }





}
