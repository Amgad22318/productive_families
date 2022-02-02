import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        height: 200,
        centerTitle: true,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 32,
                ),
                DefaultText(
                  text: 'مستخدم',
                  textStyle: Theme.of(context).textTheme.headline5,
                ),
                IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState!.showBottomSheet(
                          (context) => const ProfileBottomSheet());
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
                    radius: 70,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            DefaultFormField(
              hintText: '',
              textColor: darkBlue,
              height: 60,
              horizontalPadding: 32,
              controller: nameController,
              validator: (text) {},
              keyboardType: TextInputType.text,
              backgroundColor: Colors.transparent,
              labelText: 'الأسم',
              inputEnabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: darkBlue,
                ),
              ),
              inputFocusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: darkBlue),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            DefaultFormField(
              hintText: '',
              textColor: darkBlue,
              height: 60,
              horizontalPadding: 32,
              controller: phoneController,
              validator: (text) {},
              keyboardType: TextInputType.text,
              backgroundColor: Colors.transparent,
              labelText: 'رقم الهاتف',
              inputEnabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: darkBlue,
                ),
              ),
              inputFocusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: darkBlue),
              ),
              suffixIcon: SizedBox(
                height: 24,
                width: 24,
                child: IconButton(
                    onPressed: () {},
                    padding: EdgeInsetsDirectional.zero,
                    iconSize: 18,
                    icon: const Icon(
                      Icons.edit,
                      color: darkBlue,
                    )),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            DefaultFormField(
              height: 60,
              labelText: 'العنوان',
              hintText: '',
              textColor: darkBlue,
              horizontalPadding: 32,
              controller: locationController,
              validator: (text) {},
              keyboardType: TextInputType.text,
              backgroundColor: Colors.transparent,
              suffixIcon: IconButton(
                padding: EdgeInsets.zero,iconSize: 51,

                onPressed: () {},
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: DefaultText(
                        text: 'تغيير',
                        textStyle: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold),
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/map-location.svg',
                      color: darkBlue,
                      width: 24,
                      height: 24,
                    )
                  ],
                ),
              ),
              inputEnabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: darkBlue,
                ),
              ),
              inputFocusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: darkBlue),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 16, end: 16, bottom: 32),
              child: DefaultMaterialButton(
                height: 50,
                onPressed: () {},
                text: 'حفظ التغييرات',
              ),
            )
          ],
        ),
      ),
    );
  }
}
