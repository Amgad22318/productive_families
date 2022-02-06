import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class OrderConfirmationScreen extends StatelessWidget {
  OrderConfirmationScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController discountCodeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController addNateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        height: 80,
        centerTitle: true,
        actions: [
          GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SvgPicture.asset(
                  "assets/icons/back_arrow.svg",
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              })
        ],
        title: const DefaultText(
          text: 'تأكيد الطلب',
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
                    DefaultText(
                      text: 'الاسم الاول',
                      textStyle: Theme.of(context).textTheme.headline6,
                    ),
                    DefaultFormField(
                      controller: nameController,
                      validator: (p0) {},
                      keyboardType: TextInputType.text,
                      backgroundColor: orderFormFieldBackGroundGrey,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DefaultText(
                      text: 'رقم الهاتف',
                      textStyle: Theme.of(context).textTheme.headline6,
                    ),
                    DefaultFormField(
                      controller: phoneNumberController,
                      validator: (p0) {},
                      keyboardType: TextInputType.text,
                      backgroundColor: orderFormFieldBackGroundGrey,
                    ),
                    const SizedBox(height: 20),
                    DefaultText(
                      text: 'كود الخصم',
                      textStyle: Theme.of(context).textTheme.headline6,
                    ),
                    DefaultFormField(
                      controller: discountCodeController,
                      validator: (p0) {},
                      keyboardType: TextInputType.text,
                      backgroundColor: orderFormFieldBackGroundGrey,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        DefaultText(
                          text: 'العنوان بالتفصيل',
                          textStyle: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        DefaultIconButton(
                          background: backGroundWhite,
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/icons/map-location.svg",
                            color: Colors.black,
                            width: 25,
                            height:25,
                          ),
                        )
                      ],
                    ),
                    DefaultFormField(
                      height: 100,
                      controller: locationController,
                      validator: (p0) {},
                      keyboardType: TextInputType.multiline,
                      backgroundColor: orderFormFieldBackGroundGrey,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 20),
                    DefaultText(
                      text: 'إضافة ملاحظات',
                      textStyle: Theme.of(context).textTheme.headline6,
                    ),
                    DefaultFormField(
                      height: 100,
                      controller: addNateController,
                      validator: (p0) {},
                      keyboardType: TextInputType.multiline,
                      backgroundColor: orderFormFieldBackGroundGrey,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 40),
                    DefaultMaterialButton(
                      onPressed: () {},
                      text: 'تأكيد الطلب',
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
