import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class DeliveryRepresentativeLocationPicker extends StatelessWidget {
  DeliveryRepresentativeLocationPicker({Key? key}) : super(key: key);
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: DefaultShopAppbar(
        height: 80,
        centerTitle: true,
        title: DefaultText(
          text: 'تحديد العنوان',
          textStyle: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset('assets/icons/back_arrow.svg'))
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: size.height * 0.7,
            width: double.maxFinite,
            // map location
            child: const Image(
              image: AssetImage('assets/image/map.png'),
              fit: BoxFit.fill,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Center(
                  child: Image(
                      image:
                          AssetImage('assets/image/appbar_half_circle.png'))),
              Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  color: darkBlue,
                ),
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
                          // DefaultMaterialButton(text: 'text', onPressed: () {}),
                          DefaultFormField(
                              hintText: '',
                              prefixIcon:  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(

                                  'assets/icons/location.svg',
                                  height: 24.0, width: 24.0,
                                  color: Colors.white,
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
                                  context, DELIVERY_REPRESENTATIVE_SHOP_LAYOUT, (route) => false);
                            },
                            height: size.height * 0.06,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
