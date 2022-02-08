import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_outlined_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/dotted_line_seperator.dart';

class QuotationsItem extends StatelessWidget {
  const QuotationsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: size.height * 0.15,
                  width: size.width * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: const DecorationImage(
                          image: AssetImage(
                            'assets/image/user_photo.png',
                          ),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(
                  text: "اسم المنتج",
                  textStyle: Theme.of(context).textTheme.bodyText1,
                  // textStyle: TextStyle(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [

                        DefaultText(
                          text: "عرض السعر",
                          textStyle: Theme.of(context).textTheme.caption,
                          color: backGroundRed,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10),
                      child: Row(
                        children: [
                          const DefaultText(
                            text: '(تقييم 30)',
                            textStyle: TextStyle(color: Colors.grey, fontSize: 8),
                          ),
                          RatingBarIndicator(
                            rating: 2.6,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 15.0,
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: DefaultMaterialButton(
                        onPressed: () {},
                        text: 'قبول',
                        background: darkBlue,
                        textColor: backGroundWhite,


                      ),
                      height: size.height * 0.04,
                      width: size.width * 0.28,
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
                      width: size.width * 0.28,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
