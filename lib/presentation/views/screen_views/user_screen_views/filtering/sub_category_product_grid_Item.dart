import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/constants.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/constants/weights.dart';
import 'package:productive_families/data/models/user_models/products/user_sub_category_product_model.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_cached_network_image.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../shared/fav_bottom_sheet.dart';

class SubCategoryProductGridItem extends StatelessWidget {
  final Products productModel;
  const SubCategoryProductGridItem( {Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, USER_ABOUT_PRODUCT,arguments: productModel.id);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 2,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 20.h,

                  child: DefaultCachedNetworkImage(imageUrl: productModel.image.path, fit: BoxFit.cover)
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultIconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => Padding(
                              padding: MediaQuery.of(context).viewInsets,
                            child:  FavBottomSheet(productId: productModel.id),
                          ),
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,


                      );
                    },
                    icon: productModel.favorite==0? const Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.red,
                    ):const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    background: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: DefaultText(
                              text: productModel.name,
                              textStyle: Theme.of(context).textTheme.overline,
                              fontWeight: FontWeights.bold,
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: DefaultText(
                              textAlign: TextAlign.end,
                              color: goldTextAndStars,
                              text: productModel.price.toString()+ ' $AppCurrencyShortcut',
                              textStyle: Theme.of(context).textTheme.overline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: DefaultText(
                              color: Colors.grey,
                              text: '(${productModel.rateTimes} تقييم)',
                              textStyle: Theme.of(context).textTheme.overline,
                            ),
                          ),
                          Flexible(
                            flex: 0,
                            child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: RatingBarIndicator(
                                rating: productModel.rate.toDouble(),
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 9.0,
                                direction: Axis.horizontal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
