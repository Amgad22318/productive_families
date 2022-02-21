import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/delivery_representative_screen_views/order/dr_order_sent_bottom_sheet.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class DeliveryRepresentativeOrderDelivering extends StatelessWidget {
  const DeliveryRepresentativeOrderDelivering({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        height: 80,
        centerTitle: true,
        title: DefaultText(
          text: 'توصيل الطلب',
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
                      image: AssetImage('assets/image/appbar_half_circle.png')),
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
                    child: DefaultMaterialButton(
                      text: 'تم توصيل الطلب',
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) =>
                              const DeliveryRepresentativeOrderSentBottomSheet(),
                        );
                      },
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
