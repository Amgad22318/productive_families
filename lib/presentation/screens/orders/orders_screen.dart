import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/views/orders_and_meal_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: DefaultShopAppbar(
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
          text: 'طلباتك',
          textStyle: TextStyle(),
        ),
      ),
      body: Column(
        children: [
          const Image(image: AssetImage('assets/image/appbar_half_circle.png')),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  OrdersAndMealItem(
                    iconButton: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: const [
                          CircleAvatar(
                            backgroundColor: Color(0xFFFF0000),
                            radius: 5,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          DefaultText(
                            text: 'قيد التحضير',color: Color(0xFFFF0000),
                            textStyle: TextStyle(
                                fontSize: 10, ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  OrdersAndMealItem(
                    iconButton: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: const [
                          CircleAvatar(
                            backgroundColor: Color(0xFF15C808),
                            radius: 5,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          DefaultText(
                            text: 'قيد التحضير',color: Color(0xFF15C808),
                            textStyle: TextStyle(
                                fontSize: 10, ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
