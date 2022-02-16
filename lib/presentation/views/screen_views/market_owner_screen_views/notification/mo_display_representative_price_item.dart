import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_outlined_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class MarketOwnerDisplayRepresentativePriceItem extends StatelessWidget {
  const MarketOwnerDisplayRepresentativePriceItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Material(
        color: lightDefaultYellow,

        child: InkWell(
          onTap: (){
            Navigator.pushNamedAndRemoveUntil(context, QUOTATIONS_SCREEN, (route) => false);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const Expanded(flex: 1,
                    child: CircleAvatar(
                        // child: Text('logo'),
                        ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultText(
                            maxLines: 1,
                            text: 'طلب جديد',
                            textStyle: Theme.of(context).textTheme.bodyText1),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                                maxLines: 1,
                                text: 'اسم العميل',
                                textStyle: Theme.of(context).textTheme.bodyText1,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: DefaultText(
                                      color: backGroundRed,
                                      maxLines: 1,
                                      text: 'سعر الطلب',
                                      textStyle: Theme.of(context).textTheme.bodyText1),
                                ),
                                Row(
                                  children: [
                                    DefaultMaterialButton(
                                      textColor: Colors.white,
                                      width: 80,
                                      background: darkBlue,
                                      height: 35,
                                      text: 'قبول',
                                      onPressed: () {
                                        Navigator.pushNamed(context,
                                            MARKET_OWNER_ORDER_DETAILS_SCREEN);
                                      },
                                    ),
                                    SizedBox(width: 15,),
                                    DefaultOutlinedButton(
                                      borderColor: darkBlue,
                                      width: 80,
                                      height: 35,
                                      text: 'رفض',
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),


                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
