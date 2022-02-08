import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_outlined_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class DisplayRepresentativePriceItem extends StatelessWidget {
  const DisplayRepresentativePriceItem({Key? key}) : super(key: key);

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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    CircleAvatar(
                        // child: Text('logo'),
                        )
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                          maxLines: 1,
                          text: 'إشعار من التطبيق',
                          textStyle: Theme.of(context).textTheme.bodyText1),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              DefaultText(
                                  maxLines: 1,
                                  text: 'اسم المندوب',
                                  textStyle: Theme.of(context).textTheme.bodyText1,
                              ),

                              DefaultText(
                                  color: backGroundRed,
                                  maxLines: 1,
                                  text: 'عرض السعر',
                                  textStyle: Theme.of(context).textTheme.bodyText1),
                            ],
                          ),
                        ],
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RatingBarIndicator(
                            rating: 2.6,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 20.0,
                            direction: Axis.horizontal,
                          ),

                          const DefaultText(
                            text: '(تقييم 30)',
                            textStyle: TextStyle(color: Colors.grey, fontSize:10),
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
    );
  }
}
