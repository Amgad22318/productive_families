import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:productive_families/business_logic/user/profile/user_profile_cubit.dart';
import 'package:productive_families/presentation/views/screen_views/shared/image_picker/image_picker_bottom_sheet.dart';

import '../../../../../constants/constant_methods.dart';

class UpdateProfileImageBottomSheet extends StatelessWidget {
  final UserProfileCubit userProfileCubit;

  const UpdateProfileImageBottomSheet(
      {Key? key, required this.userProfileCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImagePickerBottomSheet(
      cameraOnTap: () {
        Navigator.pop(context);
        pickImage(ImageSource.camera).then((image) {
          if (image != null) {
            userProfileCubit.updateUserProfile(
                phone: null, name: null, image: image, mode: 0);
          }
        });
      },
      galleryOnTap: () {
        Navigator.pop(context);
        pickImage(ImageSource.gallery).then((image) {
          if (image != null) {
            userProfileCubit.updateUserProfile(
                phone: null, name: null, image: image, mode: 0);
          }
        });
      },
    );
  }
}
