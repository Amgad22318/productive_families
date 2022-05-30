import 'package:flutter/material.dart';
import 'package:productive_families/constants/weights.dart';
import 'package:productive_families/data/models/user_models/products/user_show_product_model.dart';
import 'package:productive_families/presentation/widgets/default_cached_network_image.dart';
import 'package:productive_families/presentation/widgets/default_rating_bar_indicator.dart';

import '../../../../../data/models/shared_models/shared_classes/api_review.dart';
import '../../../../styles/colors.dart';
import '../../../../widgets/default_text.dart';

class AboutProductReviewItem extends StatelessWidget {
  final ApiReview reviewModel;
  const AboutProductReviewItem({Key? key, required this.reviewModel})
      : super(key: key);

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
                    DefaultCachedNetworkImage(
                        imageUrl: reviewModel.reviewImage.path,
                        fit: BoxFit.cover)
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
                        text: reviewModel.userName,
                        fontWeight: FontWeights.bold,
                        textStyle: Theme.of(context).textTheme.bodyText1,
                        // textStyle: TextStyle(),
                      ),
                      DefaultRatingBarIndicator(
                        rating: reviewModel.rate.toDouble(),
                        itemCount: 4,
                        itemSize: 20,
                      ),
                      DefaultText(
                        maxLines: 2,
                        text: reviewModel.comment,
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
