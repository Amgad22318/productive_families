import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/order/orders_item.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, SHOP_LAYOUT, (route) => false);

        return true;
      },
      child: Scaffold(
        appBar: DefaultShopAppbar(
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, SHOP_LAYOUT, (route) => false);
              },
              padding: EdgeInsetsDirectional.zero,
              icon: SvgPicture.asset(
                "assets/icons/back_arrow.svg",
                color: darkBlue,
              ),
            ),
          ],
          title: const DefaultText(
            text: 'طلباتك',
            textStyle: TextStyle(),
          ),
        ),
        body: Column(
          children: [
            const Image(
                image: AssetImage('assets/image/appbar_half_circle.png')),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    OrdersItem(
                      color: backGroundRed,
                    ),
                    OrdersItem(
                      color: backGroundAccentYellow,
                    ),
                    OrdersItem(
                      color: backGroundGreen,
                    ),
                    OrdersItem(
                      color: backGroundRed,
                    ),
                    OrdersItem(
                      color: backGroundGreen,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
