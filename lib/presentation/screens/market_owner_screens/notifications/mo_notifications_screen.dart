import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/shop_layout/mo_shop_layout.dart';
import 'package:productive_families/presentation/screens/user_screens/shop_layout/user_shop_layout.dart';
import 'package:productive_families/presentation/views/screen_views/market_owner_screen_views/notification/mo_app_notification_item.dart';
import 'package:productive_families/presentation/views/screen_views/market_owner_screen_views/notification/mo_display_representative_price_item.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/notification/app_notification_item.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/notification/display_representative_price_item.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class MarketOwnerNotificationsScreen extends StatelessWidget {
  const MarketOwnerNotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultShopAppbar(
          height: 80,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                navigateToAndFinish(context,const MarketOwnerShopLayout());
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
                  MarketOwnerAppNotificationItem(),
                  MarketOwnerDisplayRepresentativePriceItem(),
                  MarketOwnerAppNotificationItem(),
                  MarketOwnerDisplayRepresentativePriceItem(),
                  MarketOwnerAppNotificationItem(),
                  MarketOwnerDisplayRepresentativePriceItem(),
                ],
              ),
            )
          ],
        ));
  }
}
