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
                flex: 1,
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
                flex: 1,
                child: Container(
                  color: Colors.white,
                  // child: const Center(child: Text('map')),
                ),
              ),
            ],
          ),


          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                    height: 60,
                    width: 60,
                    child:Image(image: AssetImage('assets/image/clock.png'))
                ),
                const SizedBox(height: 5,),
                DefaultText(text: '45 min', textStyle: Theme.of(context).textTheme.bodyText1),
                const SizedBox(height: 5,),
                DefaultText(text: 'ميعاد التوصيل', textStyle: Theme.of(context).textTheme.bodyText1),
                const SizedBox(height: 15,),
                const Card(
                  shadowColor: greyText,
                  elevation: 8,
                  child: OrderFollowUpItem(),
                ),
                DefaultMaterialButton(
                  onPressed: (){
                    showModalBottomSheet(
                        shape:const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(32),topRight: Radius.circular(32),)
                        ),
                        isScrollControlled: true,
                        context: context, builder: (context)=>OrderTrackingBottomSheet());


                  },text: "متابعة الطلب على الخريطه",)
              ],
            ),
          )
        ],
      ),
    );
  }
}
