import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_outlined_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class DisplayRepresentativePriceItem extends StatelessWidget {
  const DisplayRepresentativePriceItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      height: size.height * 0.20,
      width: double.infinity,
      color: const Color(0xFFFFF4BE),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              CircleAvatar(
                  // child: Text('logo'),
                  )
            ],
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                    maxLines: 1,
                    text: 'إشعار من التطبيق',
                    textStyle: Theme.of(context).textTheme.bodyText1),
                SizedBox(
                  height: size.height * 0.01,
                ),
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
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        DefaultText(
                            color: backGroundRed,
                            maxLines: 1,
                            text: 'عرض السعر',
                            textStyle: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          child: DefaultMaterialButton(
                            onPressed: () {},
                            text: 'قبول',
                            background: darkBlue,
                            textColor: backGroundWhite,
                          ),
                          height: size.height * 0.04,
                          width: size.width * 0.23,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          child: DefaultOutlinedButton(
                            onPressed: () {},
                            text: 'رفض',
                          ),
                          height: size.height * 0.04,
                          width: size.width * 0.23,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
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
                    SizedBox(width: size.width * 0.01,),
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
    );
  }
}
