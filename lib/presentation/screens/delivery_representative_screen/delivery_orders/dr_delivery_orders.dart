import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/views/screen_views/delivery_representative_screen_views/delivery_orders/dr_delivery_orders_list_itme.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class DeliveryRepresentativeDeliveryOrders extends StatelessWidget {
  const DeliveryRepresentativeDeliveryOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        centerTitle: true,
        title: DefaultText(
          textStyle: Theme.of(context).textTheme.headline5,
          text: 'طلبات  التوصيل',
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)..pop()..pop();
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
              child: ListView(
                children: [DeliveryRepresentativeDeliveryOrdersListItem(orderAccepted: true,),
                  DeliveryRepresentativeDeliveryOrdersListItem(),
                  DeliveryRepresentativeDeliveryOrdersListItem(orderAccepted: true,),
                  DeliveryRepresentativeDeliveryOrdersListItem(),
                  DeliveryRepresentativeDeliveryOrdersListItem(),
                  DeliveryRepresentativeDeliveryOrdersListItem(),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
