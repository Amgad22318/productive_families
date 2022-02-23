import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/views/screen_views/delivery_representative_screen_views/notification/dr_app_notification_item.dart';
import 'package:productive_families/presentation/views/screen_views/delivery_representative_screen_views/notification/dr_user_order_item.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class DeliveryRepresentativeNotificationsScreen extends StatelessWidget {
  const DeliveryRepresentativeNotificationsScreen({Key? key}) : super(key: key);

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
            text: 'الإشعارات',
            textStyle: TextStyle(),
          ),
        ),
        body: Column(
          children: [
            const Image(
                image: AssetImage('assets/image/appbar_half_circle.png')),
            Expanded(

              child: ListView(
                children: const [
                  DeliveryRepresentativeAppNotificationItem(),
                  DisplayRepresentativeUserOrderItem(),
                  DeliveryRepresentativeAppNotificationItem(),
                  DisplayRepresentativeUserOrderItem(),
                  DeliveryRepresentativeAppNotificationItem(),
                  DisplayRepresentativeUserOrderItem(),
                ],
              ),
            )
          ],
        ));
  }
}
