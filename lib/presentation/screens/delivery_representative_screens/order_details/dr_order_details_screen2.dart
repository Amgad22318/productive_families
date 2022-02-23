import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/presentation/screens/user_screens/shop_layout/shop_layout.dart';
import 'package:productive_families/presentation/views/screen_views/delivery_representative_screen_views/notification/dr_app_notification_item.dart';
import 'package:productive_families/presentation/views/screen_views/delivery_representative_screen_views/notification/dr_user_order_item.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/notification/app_notification_item.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/notification/display_representative_price_item.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class DeliveryRepresentativeOrderDetailsScreen2 extends StatelessWidget {
  const DeliveryRepresentativeOrderDetailsScreen2({Key? key}) : super(key: key);

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
            text: 'تفاصيل الطلب',
            textStyle: TextStyle(),
          ),
        ),
        body: Column(
          children: [
            const Image(
                image: AssetImage('assets/image/appbar_half_circle.png')),

          ],
        ));
  }
}
