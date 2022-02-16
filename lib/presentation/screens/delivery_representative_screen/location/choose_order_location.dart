import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class DeliveryRepresentativeChooseOrderLocation extends StatelessWidget {
  DeliveryRepresentativeChooseOrderLocation({Key? key}) : super(key: key);
  final TextEditingController fromLocationController = TextEditingController();
  final TextEditingController toLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: DefaultShopAppbar(
        height: 80,
        centerTitle: true,
        title: DefaultText(
          text: 'موقع الطلب',
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
      body: Column(
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
                          padding: const EdgeInsetsDirectional.only(start: 16.0),
                          child: DefaultText(
                            color: Colors.white,
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
                          ),
                          child: DefaultText(
                              color: Colors.white,

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
                          padding: const EdgeInsetsDirectional.only(top: 16.0,),
                          child: DefaultMaterialButton(
                            text: 'متابعة',
                            onPressed: () {
                              Navigator.pop(context);

                            },
                          ),
                        )
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
