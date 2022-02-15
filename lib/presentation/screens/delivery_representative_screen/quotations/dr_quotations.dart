import 'package:flutter/material.dart';
import 'package:productive_families/presentation/views/screen_views/delivery_representative_screen_views/quotations/dr_quotations_list_itme.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class DeliveryRepresentativeQuotations extends StatelessWidget {
  const DeliveryRepresentativeQuotations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultShopAppbar(
        centerTitle: true,
        title: DefaultText(
          textStyle: Theme.of(context).textTheme.headline5,
          text: 'عروض الأسعار',
        ),

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
                itemBuilder: (BuildContext context, int index) =>DeliveryRepresentativeQuotationsListItem(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
