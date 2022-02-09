import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/order_details_item.dart';
import 'package:productive_families/presentation/views/payment_summary_item.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{ 
        Navigator.of(context)..pop()..pop();
        return true;
      },
      child: Scaffold(
        appBar: DefaultShopAppbar(
          height: 80,
          centerTitle: true,
          actions: [
            IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/back_arrow.svg",
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context)..pop()..pop();

                })

          ],
          title: const DefaultText(
            text: 'تفاصيل الطلب',
            textStyle: TextStyle(),
          ),
        ),
        body: Column(
          children: [
            const Image(image: AssetImage('assets/image/appbar_half_circle.png')),
            Expanded(
              child: ListView(
                children: [
                  OrderDetailsItem(color: backGroundRed),
                  OrderDetailsItem(color: backGroundRed),
                  OrderDetailsItem(color: backGroundRed),
                  OrderDetailsItem(color: backGroundRed),
                ],
              ),
            ),
            const PaymentSummaryItem(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20,right: 20,left: 20,top: 30),
              child: DefaultMaterialButton(onPressed: (){

                Navigator.pushNamedAndRemoveUntil(context, ORDER_FOLLOW_UP, (route) => false);
              },text: 'تأكيد الطلب',),
            )
          ],
        ),
      ),
    );
  }
}
