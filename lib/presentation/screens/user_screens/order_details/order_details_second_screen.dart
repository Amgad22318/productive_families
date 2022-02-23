import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/order/order_details_second_screen_item.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/order/payment_summary_item.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/payment_summary/payment_summary_item.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/dotted_line_seperator.dart';

class OrderDetailsSecondScreen extends StatelessWidget {
  const OrderDetailsSecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
              Navigator.pop(context);
            },
          )
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
           PaymentSummaryItem(children: [
             DefaultText(
               text: 'ملخص الدفع',
               textStyle: Theme.of(context).textTheme.bodyText1,
               color:const Color(0xFF9FBBEB),
             ),
             const PaymentSummaryInnerItem(text: 'تكلفة الدفع:', price: '279.00\$'),
             const PaymentSummaryInnerItem(text: 'الضريبه المضافه:', price: '10.00\$'),
             const PaymentSummaryInnerItem(text: 'رسوم الشحن:', price: '10.00\$'),
             const PaymentSummaryInnerItem(text: 'كود الخصم:', price: '10.00\$'),





             const  Padding(
               padding: EdgeInsets.symmetric(vertical: 8.0),
               child: DottedLineSeparator(),
             ),
             PaymentSummaryInnerItem(text:  'السعر الكلى:', price: '299.00\$'),
           ],),
          Container(
            height: size.height * 0.05,
          )
        ],
      ),
    );
  }
}
