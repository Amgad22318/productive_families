import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/order_details_item.dart';
import 'package:productive_families/presentation/views/order_details_second_screen_item.dart';
import 'package:productive_families/presentation/views/orders_item.dart';
import 'package:productive_families/presentation/views/payment_summary_item.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/views/orders_and_meal_item.dart';

class OrderDetailsSecondScreen extends StatelessWidget {
   OrderDetailsSecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: DefaultShopAppbar(
        height: 80,
        centerTitle: true,
        actions: [
          GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SvgPicture.asset(
                  "assets/icons/back_arrow.svg",
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
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
                OrderDetailsSecondScreenItem(color: backGroundRed),
                OrderDetailsSecondScreenItem(color: backGroundRed),
                OrderDetailsSecondScreenItem(color: backGroundRed),
                OrderDetailsSecondScreenItem(color: backGroundRed),


              ],
            ),
          ),
          PaymentSummaryItem(),
         Container(
           height: size.height*0.05,
         )
        ],
      ),
    );
  }
}
