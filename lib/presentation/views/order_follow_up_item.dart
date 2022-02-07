import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
class OrderFollowUpItem extends StatelessWidget {
  const OrderFollowUpItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0,top: 5),
                    child: SvgPicture.asset(
                      "assets/icons/Line.svg",
                      color: Colors.grey,
                    ),
                  ),
                  Column(
                    children: [
                      const CircleAvatar(
                        backgroundColor: greyText,
                        child: Icon(
                          Icons.check,
                          color: backGroundGreen,
                          size: 25,
                        ),
                      ),
                      SizedBox(height: size.height*0.05,),
                      const CircleAvatar(
                        backgroundColor: greyText,
                        child: Icon(
                          Icons.check,
                          color: backGroundGreen,
                          size: 25,
                        ),
                      ),
                      SizedBox(height: size.height*0.05,),
                      const CircleAvatar(
                        backgroundColor: greyText,
                        child: Icon(
                          Icons.check,
                          color: backGroundGreen,
                          size: 25,
                        ),
                      ),
                      SizedBox(height: size.height*0.05,),
                      const CircleAvatar(
                        backgroundColor: greyText,
                        child: Icon(
                          Icons.check,
                          color: backGroundGreen,
                          size: 25,
                        ),
                      ),

                    ],
                  ),
                ],
              ),
              SizedBox(width: size.width*0.12,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                          text: 'تمت الموافقه على الطلب',
                          textStyle: Theme.of(context).textTheme.bodyText1),
                      DefaultText(
                          text: '02:00  june 17\-pm ',
                          textStyle: Theme.of(context).textTheme.bodyText2),
                    ],
                  ),
                  SizedBox(height: size.height*0.04,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                          text: 'الطلب قيد التحضير',
                          textStyle: Theme.of(context).textTheme.bodyText1),
                      DefaultText(
                          text: '02:00  june 17\-pm ',
                          textStyle: Theme.of(context).textTheme.bodyText2),
                    ],
                  ),
                  SizedBox(height: size.height*0.04,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                          text: 'الطلب قيد التوصيل',
                          textStyle: Theme.of(context).textTheme.bodyText1),
                      DefaultText(
                          text: '02:00  june 17\-pm ',
                          textStyle: Theme.of(context).textTheme.bodyText2),
                    ],
                  ),
                  SizedBox(height: size.height*0.04,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(

                          text: 'تم توصيل الطلب',
                          textStyle: Theme.of(context).textTheme.bodyText1),
                      DefaultText(
                          text: '02:00  june 17\-pm ',
                          textStyle: Theme.of(context).textTheme.bodyText2),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

