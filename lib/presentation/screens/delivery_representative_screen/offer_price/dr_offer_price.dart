import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class DeliveryRepresentativeOfferPrice extends StatelessWidget {
  DeliveryRepresentativeOfferPrice({Key? key}) : super(key: key);
  final TextEditingController fromLocationController = TextEditingController();
  final TextEditingController toLocationController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        centerTitle: true,
        title: DefaultText(
          textStyle: Theme.of(context).textTheme.headline5,
          text: 'عرض السعر',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset('assets/icons/back_arrow.svg'))
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/image/appbar_half_circle.png',
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 16.0),
                      child: DefaultText(
                          text: 'من',
                          textStyle: Theme.of(context).textTheme.bodyText1),
                    ),
                    DefaultFormField(
                      readOnly: true,
                      onTap: () {
                        Navigator.pushNamed(context, DELIVERY_REPRESENTATIVE_CHOOSE_ORDER_LOCATION);
                      },
                        backgroundColor: lightBlue.withOpacity(0.76),
                        hintText: '',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            'assets/icons/location.svg',
                            height: 24.0,
                            width: 24.0,
                            color: Colors.white,
                          ),
                        ),
                        controller: fromLocationController,
                        validator: (text) {},
                        keyboardType: TextInputType.text),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 16.0,
                        top: 8,
                      ),
                      child: DefaultText(
                          text: 'إلى',
                          textStyle: Theme.of(context).textTheme.bodyText1),
                    ),
                    DefaultFormField(
                        readOnly: true,
                        onTap: () {
                          Navigator.pushNamed(context, DELIVERY_REPRESENTATIVE_CHOOSE_ORDER_LOCATION);
                        },
                        backgroundColor: lightBlue.withOpacity(0.76),
                        hintText: '',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            'assets/icons/location.svg',
                            height: 24.0,
                            width: 24.0,
                            color: Colors.white,
                          ),
                        ),
                        controller: toLocationController,
                        validator: (text) {},
                        keyboardType: TextInputType.text),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 16.0,
                        top: 30,
                      ),
                      child: DefaultText(
                          text: 'ملاحظات العميل',
                          textStyle: Theme.of(context).textTheme.bodyText1),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: DefaultFormField(
                          height: 100,
                          backgroundColor: lightBlue.withOpacity(0.30),
                          hintText: '',
                          controller: notesController,
                          validator: (text) {},
                          keyboardType: TextInputType.text),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 16.0,
                        top: 30,
                      ),
                      child: DefaultText(
                          color: greyText,
                          text: 'إدخال عرض السعر',
                          textStyle: Theme.of(context).textTheme.headline6),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: DefaultFormField(
                          height: 50,
                          maxLines: 1,
                          backgroundColor: lightBlue,
                          hintText: '',
                          controller: priceController,
                          validator: (text) {},
                          keyboardType: TextInputType.number),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          top: 60.0, bottom: 20),
                      child: DefaultMaterialButton(
                        text: 'إرسال عرض السعر',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
