import 'package:flutter/material.dart';
import 'package:productive_families/constants/weights.dart';
import 'package:productive_families/presentation/widgets/default_cached_network_image.dart';
import 'package:productive_families/presentation/widgets/default_rating_bar_indicator.dart';

import '../../../../styles/colors.dart';
import '../../../../widgets/default_text.dart';

class ReviewSearchGridItem extends StatelessWidget {
  const ReviewSearchGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Card(
        color: lightDefaultYellow2,
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
              start: 6, end: 6, top: 8, bottom: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: greyText,
                radius: 41.0,
                child: ClipOval(
                  clipBehavior: Clip.antiAlias,
                  child: DefaultCachedNetworkImage(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT56eAEwsTeSS73idggoBE6SbblF2J3lW5WIA&usqp=CAU',
                      fit: BoxFit.fill,height: 80,width: 80),
                ),
              ),
              DefaultText(
                text: "حسام سعيد",
                fontWeight: FontWeights.bold,
                textStyle: Theme.of(context).textTheme.bodyText1,
                // textStyle: TextStyle(),
              ),
              const DefaultRatingBarIndicator(
                rating: 3.7,
                itemCount: 4,
                itemSize: 20,
              ),
              DefaultText(
                maxLines: 2,
                text:
                    " منتج جيد جدا منتج جيد جدا منتج جيد جدا منتج جيد جدا منتج جيد جدا منتج جيد جدا منتج جيد جدا منتج جيد جدا منتج جيد جدا منتج جيد جدا منتج جيد جدا منتج جيد جدا",
                textStyle: Theme.of(context).textTheme.bodyText2,
                // textStyle: TextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
