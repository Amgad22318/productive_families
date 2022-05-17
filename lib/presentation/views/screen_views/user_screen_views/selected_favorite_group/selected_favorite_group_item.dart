import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:productive_families/constants/constants.dart';
import 'package:productive_families/data/models/user_models/favorites/user_favorites_group_product_model.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../../../../business_logic/user/selected_favorite_group_screen/selected_favorite_group_screen_cubit.dart';
import '../../../../../constants/end_points.dart';
import '../../../../widgets/default_cached_network_image.dart';

class SelectedFavoriteGroupItem extends StatelessWidget {
  final Products productModel;
  final SelectedFavoriteGroupScreenCubit selectedFavoriteGroupScreenCubit;
  final int groupId;
  final int index;


  const SelectedFavoriteGroupItem(
      {Key? key, required this.productModel, required this.selectedFavoriteGroupScreenCubit, required this.groupId, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double textScale = MediaQuery.textScaleFactorOf(context);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, USER_ABOUT_PRODUCT,arguments:productModel.id );
        },
        child: Card(

          clipBehavior: Clip.antiAlias,
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
              side: BorderSide(width: 1, color: defaultYellow)),
          child: LimitedBox(
            maxHeight: 20.h * textScale,
            child: Row(
              children: [
                Flexible(
                    flex: 30,
                    child: SizedBox.expand(
                        child: DefaultCachedNetworkImage(
                            imageUrl: productModel.image.path,
                            fit: BoxFit.cover))),
                const Spacer(),
                Expanded(
                  flex: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: DefaultText(
                                text: productModel.name,
                                textStyle: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyText1,
                                // textStyle: TextStyle(),
                              ),
                            ),
                            Flexible(
                              flex: 0,
                              child: DefaultIconButton(
                                  width: 36,
                                  height: 36,
                                  background: darkBlue,
                                  onPressed: () {
                                    selectedFavoriteGroupScreenCubit
                                        .userFavoritesGroupProductDelete(
                                        groupId: groupId,
                                        productId: productModel.id,index: index);
                                  },
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: lightDefaultYellow,
                                    size: 18,
                                  )),
                            ),
                          ],
                        ),
                        DefaultText(
                          text: productModel.price.toString() +
                              ' $AppCurrencyShortcut',
                          color: defaultYellow,
                        ),
                        DefaultText(
                          color: greyText,
                          text: productModel.description,
                          textStyle: Theme
                              .of(context)
                              .textTheme
                              .caption,
                          maxLines: 2,
                        ),
                        Row(
                          children: [
                            RatingBarIndicator(
                              rating: productModel.rate.toDouble(),
                              itemBuilder: (context, index) =>
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 15.0,
                              direction: Axis.horizontal,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            DefaultText(
                              color: greyText,
                              text: '(تقييم ${productModel.rateTimes})',
                              textStyle: Theme
                                  .of(context)
                                  .textTheme
                                  .overline,
                            ),
                          ],
                        ),
                      ],
                    ),
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
