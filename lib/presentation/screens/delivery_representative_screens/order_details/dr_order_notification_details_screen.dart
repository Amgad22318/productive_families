import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/constants/enums.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/delivery_representative_screen_views/order/dr_order_and_notification_details_list_item.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/order/payment_summary_item.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/payment_summary/payment_summary_item.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_outlined_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/dotted_line_seperator.dart';

class DeliveryRepresentativeOrderNotificationDetailsScreen
    extends StatefulWidget {
  const DeliveryRepresentativeOrderNotificationDetailsScreen({Key? key})
      : super(key: key);

  @override
  State<DeliveryRepresentativeOrderNotificationDetailsScreen> createState() =>
      _DeliveryRepresentativeOrderNotificationDetailsScreenState();
}

class _DeliveryRepresentativeOrderNotificationDetailsScreenState
    extends State<DeliveryRepresentativeOrderNotificationDetailsScreen> {
  OrderAddressConfirmationRadioValues? _character =
      OrderAddressConfirmationRadioValues.paypal;

  @override
  Widget build(BuildContext context) {
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
                DeliveryRepresentativeOrderDetailsListItem(),
                DeliveryRepresentativeOrderDetailsListItem(),
                DeliveryRepresentativeOrderDetailsListItem(),
                DeliveryRepresentativeOrderDetailsListItem(),
                DeliveryRepresentativeOrderDetailsListItem(),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 4.0, right: 4, bottom: 8, top: 4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: defaultYellow.withOpacity(0.3),
              ),
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 30.0),
                    child: DefaultText(
                      text: 'طريقة الدفع',
                      textStyle: Theme.of(context).textTheme.bodyText1,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: ListTile(
                          horizontalTitleGap: 0,
                          title: SvgPicture.asset(
                            'assets/icons/ShopPay - Color.svg',
                            width: 55,
                            height: 55,
                          ),
                          leading: Radio<OrderAddressConfirmationRadioValues>(
                            value: OrderAddressConfirmationRadioValues.shopPay,
                            groupValue: _character,
                            onChanged:
                                (OrderAddressConfirmationRadioValues? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        child: ListTile(
                          horizontalTitleGap: 0,
                          title: SvgPicture.asset(
                            'assets/icons/PayPal-Logo.wine.svg',
                          ),
                          leading: Radio<OrderAddressConfirmationRadioValues>(
                            value: OrderAddressConfirmationRadioValues.paypal,
                            groupValue: _character,
                            onChanged:
                                (OrderAddressConfirmationRadioValues? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          PaymentSummaryItem(
            children: [
              DefaultText(
                text: 'ملخص الدفع',
                textStyle: Theme.of(context).textTheme.bodyText1,
                color: const Color(0xFF9FBBEB),
              ),
              const PaymentSummaryInnerItem(
                  text: 'تكلفة الدفع:', price: '279.00\$'),
              const PaymentSummaryInnerItem(
                  text: 'الضريبه المضافه:', price: '10.00\$'),
              const PaymentSummaryInnerItem(
                  text: 'رسوم الشحن:', price: '10.00\$'),
              const PaymentSummaryInnerItem(
                  text: 'كود الخصم:', price: '10.00\$'),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: DottedLineSeparator(),
              ),
              const PaymentSummaryInnerItem(
                  text: 'السعر الكلى:', price: '299.00\$'),
            ],
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                      flex: 10,
                      child: DefaultMaterialButton(
                        radius: 13,
                        textScaleFactor: 1,
                        textColor: Colors.white,
                        background: darkBlue,
                        height: 40,
                        text: 'قبول',
                        fontSize: 16,
                        onPressed: () {
                          Navigator.pushNamed(
                              context, DELIVERY_REPRESENTATIVE_RECEIVING_ORDER);
                        },
                      )),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                      flex: 10,
                      child: DefaultOutlinedButton(
                        radius: 13,
                        textScaleFactor: 1,
                        fontSize: 16,
                        borderColor: darkBlue,
                        height: 40,
                        text: 'إلغاء',
                        onPressed: () {},
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
