import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/views/screen_views/market_owner_screen_views/home/mo_current_orders_and_home_list_itme.dart';

import 'package:productive_families/presentation/views/screen_views/user_screen_views/quotations/quotations_item.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class MarketOwnerCurrentOrdersScreen extends StatelessWidget {
  const MarketOwnerCurrentOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(context, SHOP_LAYOUT, (route) => false);
        return true;

      },
      child: Scaffold(
        appBar: DefaultShopAppbar(
          height: 80,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                 Navigator.pushNamedAndRemoveUntil(context, MARKET_OWNER_SHOP_LAYOUT, (route) => false);
                },
                icon: SvgPicture.asset('assets/icons/back_arrow.svg'))

          ],
          title: const DefaultText(
            text: 'الطلبات الحاليه',
            textStyle: TextStyle(),
          ),
        ),
        body: Column(
          children: [
            const Image(image: AssetImage('assets/image/appbar_half_circle.png')),
            Expanded(
                child: Padding(
                  padding:const EdgeInsetsDirectional.only(start: 5.0,end: 5.0),
                  child: ListView(
              children:const [
                  MarketOwnerCurrentOrdersAndHomeListItem(),
                  MarketOwnerCurrentOrdersAndHomeListItem(),
                  MarketOwnerCurrentOrdersAndHomeListItem(),

              ],
            ),
                )),
          ],
        ),
      ),
    );
  }
}
