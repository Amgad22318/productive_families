import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/constants/enums.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/order/payment_summary_item.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class OrderAddressConfirmationScreen extends StatefulWidget {
  const OrderAddressConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<OrderAddressConfirmationScreen> createState() =>
      _OrderAddressConfirmationScreenState();
}

class _OrderAddressConfirmationScreenState
    extends State<OrderAddressConfirmationScreen> {

  OrderAddressConfirmationRadioValues? _character =
      OrderAddressConfirmationRadioValues.paypal;

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
                SizedBox(
                  height: size.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Container(
                    height: size.height * 0.25,
                    width: double.infinity,
                    color: Colors.black,
                    // child: ,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: DefaultText(
                    text: 'العنوان',
                    textStyle: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: DefaultText(
                    text:
                        'تطبيق للربط بين الاسر المنتجة وعلائهم على أن يوفر بيئة.تطبيق للربط بين ال',
                    color: greyText,
                    maxLines: 4,
                    textStyle: Theme.of(context).textTheme.caption,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: defaultYellow.withOpacity(0.3),
                  ),
                  padding: const EdgeInsets.only(
                      bottom: 10, left: 30, right: 30, top: 10),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: 'طريقة الدفع',
                        textStyle: Theme.of(context).textTheme.headline6,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 10,
                            child: ListTile(
                             title: SvgPicture.asset('assets/icons/paypal.svg',),
                              leading:
                                  Radio<OrderAddressConfirmationRadioValues>(
                                value:
                                    OrderAddressConfirmationRadioValues.paypal,
                                groupValue: _character,
                                onChanged: (OrderAddressConfirmationRadioValues?
                                    value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),

                            ),
                          ),
                          const Spacer(
                            flex: 1
                          ),
                          Expanded(
                            flex: 10,
                            child: ListTile(
                              title: SvgPicture.asset('assets/icons/shop_pay.svg',width: 55,height: 55,),
                              leading:
                                  Radio<OrderAddressConfirmationRadioValues>(
                                value:
                                    OrderAddressConfirmationRadioValues.shopPay,
                                groupValue: _character,
                                onChanged: (OrderAddressConfirmationRadioValues?
                                    value) {
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
                const SizedBox(
                  height: 20,
                ),
                const PaymentSummaryItem(),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20, right: 20, left: 20, top: 30),
                  child: DefaultMaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ORDER_DETAILS_SCREEN,);
                    },
                    text: 'تأكيد الطلب',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
