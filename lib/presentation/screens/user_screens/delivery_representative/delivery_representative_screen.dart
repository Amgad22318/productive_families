import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class DeliveryRepresentativeScreen extends StatelessWidget {
  DeliveryRepresentativeScreen({Key? key}) : super(key: key);
  TextEditingController currentLocationController = TextEditingController();
  TextEditingController desiredLocationController = TextEditingController();
  TextEditingController additionalNotesController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        height: 80,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {Navigator.pop(context);},
            icon: SvgPicture.asset(
              "assets/icons/back_arrow.svg",
              color: Colors.black,
            ),
          )
        ],
        title: const DefaultText(
          text: 'مندوب التوصيل',
          textStyle: TextStyle(),
        ),
      ),
      body: Column(
        children: [
          const Image(image: AssetImage('assets/image/appbar_half_circle.png')),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        DefaultText(
                          text: 'من',
                          textStyle: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        DefaultIconButton(
                          background: backGroundWhite,
                          onPressed: () {
                            Navigator.pushNamed(context, DELIVERY_REPRESENTATIVE_LOCATOR_SCREEN);

                          },
                          icon: SvgPicture.asset(
                            "assets/icons/location.svg",
                            color: Colors.black,
                            width: 25,
                            height:25,
                          ),
                        )
                      ],
                    ),
                    DefaultFormField(
                      controller: currentLocationController,
                      validator: (p0) {},
                      keyboardType: TextInputType.text,
                      backgroundColor: orderFormFieldBackGroundGrey,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        DefaultText(
                          text: 'إلى',
                          textStyle: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        DefaultIconButton(
                          background: backGroundWhite,
                          onPressed: () {
                            Navigator.pushNamed(context, DELIVERY_REPRESENTATIVE_LOCATOR_SCREEN);

                          },
                          icon: SvgPicture.asset(
                            "assets/icons/location.svg",
                            color: Colors.black,
                            width: 25,
                            height:25,
                          ),
                        )
                      ],
                    ),
                    DefaultFormField(
                      controller: desiredLocationController,
                      validator: (p0) {},
                      keyboardType: TextInputType.text,
                      backgroundColor: orderFormFieldBackGroundGrey,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        DefaultText(
                          text: 'إضافة ملاحظات',
                          textStyle: Theme.of(context).textTheme.headline6,
                        ),

                      ],
                    ),
                    DefaultFormField(
                      height: 100,
                      controller: additionalNotesController,
                      validator: (p0) {},
                      keyboardType: TextInputType.multiline,
                      backgroundColor: orderFormFieldBackGroundGrey,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 60),
                    DefaultMaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, QUOTATIONS_SCREEN);

                      },
                      text: 'تأكيد الطلب',
                      textColor: darkBlue,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
