
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:productive_families/constants/enums.dart';

import 'package:productive_families/constants/end_points.dart';

import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/payment_summary_item.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';


class OrderAddressConfirmationScreen extends StatefulWidget {
   OrderAddressConfirmationScreen({Key? key}) : super(key: key);




  @override
  State<OrderAddressConfirmationScreen> createState() => _OrderAddressConfirmationScreenState();
}

class _OrderAddressConfirmationScreenState extends State<OrderAddressConfirmationScreen> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    OrderAdderssConfirmationRadioValues? _character = OrderAdderssConfirmationRadioValues.paypal;

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
                SizedBox(height: size.height*0.04,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Container(
                    height: size.height * 0.25,
                    width: double.infinity,
                    color: Colors.black,
                    // child: ,
                  ),
                ),
                const SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),

                  child: DefaultText(
                    text: 'العنوان',
                    textStyle: Theme
                        .of(context)
                        .textTheme
                        .headline6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: DefaultText(
                    text:
                    'تطبيق للربط بين الاسر المنتجة وعلائهم على أن يوفر بيئة.تطبيق للربط بين ال',
                    color: greyText,
                    maxLines: 4,
                    textStyle: Theme
                        .of(context)
                        .textTheme
                        .caption,
                  ),
                ),
                const SizedBox(
                  height: 20,

                ),
                const SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: defaultYellow.withOpacity(0.3),
                  ),
                  padding:const EdgeInsets.only(bottom: 10, left: 30, right: 30, top: 10),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: 'طريقة الدفع',
                        textStyle: Theme
                            .of(context)
                            .textTheme
                            .headline6,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: ListTile(
                              title: const Image(
                                image: AssetImage('assets/image/paypal.png'),
                                fit: BoxFit.fill,
                              ),
                              leading:
                                Radio<OrderAdderssConfirmationRadioValues>(
                                  value: OrderAdderssConfirmationRadioValues.paypal,
                                  groupValue: _character,
                                  onChanged: (OrderAdderssConfirmationRadioValues? value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                            ),
                          ),
                          Flexible(
                            child: ListTile(
                              title: const Image(
                                image: AssetImage('assets/image/shop_pay.png'),
                                fit: BoxFit.fill,
                              ),
                              leading:
                                Radio<OrderAdderssConfirmationRadioValues>(
                                  value: OrderAdderssConfirmationRadioValues.shopPay,
                                  groupValue: _character,
                                  onChanged: (OrderAdderssConfirmationRadioValues? value) {
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
                const SizedBox(height:20 ,),
                const PaymentSummaryItem(),
                Padding(

                  padding: const EdgeInsets.only(
                      bottom: 20, right: 20, left: 20, top: 30),
                  child: DefaultMaterialButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, ORDER_DETAILS_SCREEN, (route) => false);
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
