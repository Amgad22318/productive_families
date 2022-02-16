import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/profile/profile_bottom_sheet_item.dart';

class ProfileBottomSheet extends StatelessWidget {
  final String accountType;
  bool user=false;
  bool deliveryRepresentative=false;
  bool market=false;
   ProfileBottomSheet({Key? key,required this.accountType}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(accountType=='مستخدم'){
      user=true;
    }
    else if(accountType=='متجر'){
      market= true;
    }
    else{
deliveryRepresentative=true;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: const BoxDecoration(
          color: darkBlue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0))),
      child: Wrap(
        children:  [
          ProfileBottomSheetItem(userType: 'مستخدم',isActive: user,),
          ProfileBottomSheetItem(userType: 'متجر',isActive: market,),
          ProfileBottomSheetItem(userType: 'مندوب',isActive: deliveryRepresentative,),
        ],
      ),
    );
  }
}
