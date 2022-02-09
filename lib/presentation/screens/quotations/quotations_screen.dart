import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/end_points.dart';

import 'package:productive_families/presentation/views/quotations_item.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class QuotationsScreen extends StatelessWidget {
  const QuotationsScreen({Key? key}) : super(key: key);

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
                 Navigator.pushNamedAndRemoveUntil(context, SHOP_LAYOUT, (route) => false);
                },
                icon: SvgPicture.asset('assets/icons/back_arrow.svg'))

          ],
          title: const DefaultText(
            text: 'عروض الأسعار',
            textStyle: TextStyle(),
          ),
        ),
        body: Column(
          children: [
            const Image(image: AssetImage('assets/image/appbar_half_circle.png')),
            Expanded(
                child: ListView(
              children:const [
                QuotationsItem(),
                QuotationsItem(),
                QuotationsItem(),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
