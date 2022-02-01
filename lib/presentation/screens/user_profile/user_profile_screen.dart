import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/profile_bottom_sheet.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: DefaultShopAppbar(
        height: 220,
        centerTitle: true,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultText(
                  text: 'مستخدم',
                  textStyle: Theme
                      .of(context)
                      .textTheme
                      .headline5,
                ),
                IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState!.showBottomSheet((context) =>ProfileBottomSheet()
                         );
                    },
                    icon: const Icon(
                      Icons.edit,
                      size: 20,
                    ))
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                const CircleAvatar(
                    radius: 77,
                    backgroundImage: AssetImage('assets/image/user_photo.png')),
                DefaultIconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.photo_camera_outlined,
                    color: Colors.white,
                  ),
                  background: darkBlue,
                  radius: 24,
                )
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          DefaultFormField(
            controller: nameController,
            validator: (text) {},
            keyboardType: TextInputType.text,
            backgroundColor: Colors.transparent,
            labelText: 'الأسم',
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 16, end: 16, bottom: 32),
            child: DefaultMaterialButton(height: 50,
              onPressed: () {},
              text: 'حفظ التغييرات',
            ),
          )
        ],
      ),
    );
  }
}
