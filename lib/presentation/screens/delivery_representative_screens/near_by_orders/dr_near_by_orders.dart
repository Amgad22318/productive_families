import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/views/screen_views/delivery_representative_screen_views/delivery_orders/dr_delivery_orders_list_itme.dart';
import 'package:productive_families/presentation/views/screen_views/delivery_representative_screen_views/home/dr_home_and_near_by_list_itme.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class DeliveryRepresentativeNearByOrders extends StatelessWidget {
  const DeliveryRepresentativeNearByOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        centerTitle: true,
        title: DefaultText(
          textStyle: Theme.of(context).textTheme.headline5,
          text: 'الطلبات القريبة',
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
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) =>const DeliveryRepresentativeHomeAndNearByOrdersListItem(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
