import 'package:flutter/material.dart';
import 'package:productive_families/constants/weights.dart';
import 'package:productive_families/presentation/widgets/default_rating_bar_indicator.dart';

import '../../../../styles/colors.dart';
import '../../../../widgets/default_text.dart';

class AboutProductReviewItem extends StatelessWidget {
  const AboutProductReviewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double textScale = MediaQuery.textScaleFactorOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: LimitedBox(
        maxHeight: 145 * textScale,
        child: Card(
          color: lightDefaultYellow2,
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/image/make_up.png',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 6, end: 6, top: 8, bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: "حسام سعيد",
                        fontWeight: FontWeights.bold ,
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyText1,
                        // textStyle: TextStyle(),
                      ),
                       const DefaultRatingBarIndicator(
                        rating: 3.7,
                        itemCount: 4,
                        itemSize: 20,
                      ),
                      DefaultText(
                        maxLines: 2,
                        text: " منتج جيد جدا منتج جيد جدا منتج جيد جدا منتج جيد جدا منتج جيد جدا منتج جيد جدا منتج جيد جدا منتج جيد جدا منتج جيد جدا منتج جيد جدا منتج جيد جدا منتج جيد جدا",
                        textStyle: Theme.of(context).textTheme.bodyText2,
                        // textStyle: TextStyle(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
