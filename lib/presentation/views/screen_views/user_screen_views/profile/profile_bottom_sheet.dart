import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/profile/profile_bottom_sheet_item.dart';

class ProfileBottomSheet extends StatelessWidget {
  const ProfileBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: const BoxDecoration(
          color: darkBlue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0))),
      child: Wrap(
        children: const [
          ProfileBottomSheetItem(userType: 'مستخدم',isActive: true,),
          ProfileBottomSheetItem(userType: 'متجر',isActive: false,),
          ProfileBottomSheetItem(userType: 'مندوب',isActive: false,),
        ],
      ),
    );
  }
}
