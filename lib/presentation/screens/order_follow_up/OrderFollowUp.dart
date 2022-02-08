import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/order_follow_up_item.dart';
import 'package:productive_families/presentation/views/order_tracking_bottom_sheet.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';


class OrderFollowUp extends StatelessWidget {
  OrderFollowUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
          text: 'متابعة الطلب',
          textStyle: TextStyle(),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        Color(0xFFFFDC2A),
                        Color(0xFFFFF2B3),
                      ],
                    ),
                  ),
                  // child: const Center(child: Text('map')),
                ),
              ),
              Expanded(
                flex: 15,
                child: Container(
                  color: Colors.white10,
                  // child: const Center(child: Text('map')),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                "assets/icons/clock.svg",
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultText(text: '45 min', textStyle: Theme.of(context).textTheme.bodyText1),
              const SizedBox(
                height: 5,
              ),
              DefaultText(text: 'ميعاد التوصيل', textStyle: Theme.of(context).textTheme.bodyText1),
             Card(
               elevation: 10,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(15)
               ),
               margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
               child: Padding(
                 padding: const EdgeInsets.only(right: 30.0,bottom: 20),
                 child: Stack(
                   children: [
                     Positioned.directional(
                       textDirection: TextDirection.rtl,
                       start: 20,
                       top: 35,
                       child: SvgPicture.asset(
                         "assets/icons/Line.svg",
                         color: Colors.grey,
                       ),
                     ),
                     Column(
                       children: [
                         OrderFollowUpItem(text: 'تم الموافقه على الطلب',date: '02:00 pm',isDone: true,),
                         OrderFollowUpItem(text: 'الطلب قيد التحضير',date: '02:00 pm',isDone: true,),
                         OrderFollowUpItem(text: 'الطلب قيد التوصيل',date: '02:00 pm',isDone: false,),
                         OrderFollowUpItem(text: 'تم توصيل الطلب',date: '02:00 pm',isDone: false,),
                       ],
                     ),
                   ],
                 ),
               ),
             ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 20),
                child: DefaultMaterialButton(onPressed: (){},text: 'متابعة الطلب على الخريطه',),
              )
            ],
          )
        ],
      ),
    );
  }
}
