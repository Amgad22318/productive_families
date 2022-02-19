import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/screens/user_screens/chat/customer_services_chat_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/shop_layout/shop_layout.dart';

import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class GuestLocationPicker extends StatelessWidget {
  GuestLocationPicker({Key? key}) : super(key: key);
final  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
                  navigateToAndFinish(context, const ShopLayout(index: 1,));

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
                  navigateToAndFinish(context,  CustomerServicesChatScreen());

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
      body:Column(
        children: [
          Expanded(
            child: Stack(
              children: const [
                Positioned.fill(
                  child: Image(
                    image: AssetImage('assets/image/map.png'),
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
            child: Container(
              width: double.maxFinite,
              color: darkBlue,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
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
                                textStyle: Theme.of(context).textTheme.subtitle1,
                                color: Colors.white,
                              ),
                              DefaultFormField(
                                  hintText: '',
                                  prefixIcon:  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(

                                          'assets/icons/location.svg',
                                          height: 24.0, width: 24.0,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  controller: locationController,
                                  validator: (p0) {},
                                  keyboardType: TextInputType.text),
                              const SizedBox(height: 15),
                              DefaultMaterialButton(
                                text: 'تأكيد العنوان',
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, GUEST_SHOP_LAYOUT, (route) => false);
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
          ),

        ],
      ),
    );
  }
}
