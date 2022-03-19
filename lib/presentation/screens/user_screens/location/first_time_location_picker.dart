import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/business_logic/user/local/user_local_cubit.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/screens/user_screens/chat/customer_services_chat_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/shop_layout/user_shop_layout.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';


class FirstTimeLocationPicker extends StatelessWidget {
  FirstTimeLocationPicker({Key? key}) : super(key: key);
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserLocalCubit(),
      child: Scaffold(
        appBar: DefaultShopAppbar(
          height: 80,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: DefaultMaterialButton(
                  height: 50,
                  background: backGroundWhite,
                  onPressed: () {
                    navigateToAndFinish(
                        context, const UserShopLayout(index: 1,));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/shop.svg",
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'المتاجر',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: DefaultMaterialButton(
                  height: 50,
                  background: backGroundWhite,
                  onPressed: () {
                    navigateToAndFinish(context, CustomerServicesChatScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/patch-question-fll.svg",
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'استفسارات',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: const [
                  Positioned.fill(
                    child: Image(
                      image: AssetImage('assets/image/map.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                        image:
                        AssetImage('assets/image/appbar_half_circle.png')),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.maxFinite,
                    color: darkBlue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultText(
                                text: 'أدخل موقعك الحالى',
                                textStyle: Theme
                                    .of(context)
                                    .textTheme
                                    .subtitle1,
                                color: Colors.white,
                              ),
                              // DefaultMaterialButton(text: 'text', onPressed: () {}),
                              DefaultFormField(
                                  hintText: '',
                                  prefixIcon:
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/location.svg',
                                        height: 24.0, width: 24.0,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  controller: locationController,
                                  validator: (p0) {},
                                  keyboardType: TextInputType.text),
                              const SizedBox(height: 15),
                              DefaultMaterialButton(
                                text: 'تأكيد العنوان',
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, SHOP_LAYOUT, (route) => false);
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
