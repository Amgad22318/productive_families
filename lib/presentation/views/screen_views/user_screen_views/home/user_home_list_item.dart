import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:productive_families/constants/constants.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_cached_network_image.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

import '../../../../../data/models/shared_models/shared_classes/api_product.dart';

class UserHomeListItem extends StatelessWidget {
  final ApiProduct productModel;
  const UserHomeListItem({Key? key, required this.productModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, USER_ABOUT_PRODUCT,
            arguments: productModel.id);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 2,
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.1),
                  ],
                ),
              ),
              child: DefaultCachedNetworkImage(
                imageUrl: productModel.image.path,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: DefaultText(
                          text: productModel.name,
                          textStyle: Theme.of(context).textTheme.overline,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: DefaultText(
                          textAlign: TextAlign.end,
                          color: goldTextAndStars,
                          text: productModel.price.toString() +
                              ' $AppCurrencyShortcut',
                          textStyle: Theme.of(context).textTheme.overline,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: DefaultText(
                          text: productModel.serviceName,
                          textStyle: Theme.of(context).textTheme.overline,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      RatingBarIndicator(
                        rating: productModel.rate.toDouble(),
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 9.0,
                        direction: Axis.horizontal,
                      ),
                      DefaultText(
                        color: Colors.grey,
                        text: '(${productModel.rateTimes} تقييم)',
                        textStyle: Theme.of(context).textTheme.overline,
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
