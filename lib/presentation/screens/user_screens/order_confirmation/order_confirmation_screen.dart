import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class OrderConfirmationScreen extends StatelessWidget {
  OrderConfirmationScreen({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController discountCodeController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController addNateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        height: 80,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
          )

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
                          width: 8,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, ORDER_LOCATION_PICKING_SCREEN);
                          },
                          icon: SvgPicture.asset(
                            "assets/icons/location.svg",
                            color: Colors.black,
                            width: 24,
                            height:24,
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
                      onPressed: () {
Navigator.pushNamed(context, ORDER_ADDRESS_CONFIRMATION_SCREEN);
                      },
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
