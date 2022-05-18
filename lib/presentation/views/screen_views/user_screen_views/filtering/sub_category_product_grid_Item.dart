import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:productive_families/constants/constants.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/constants/weights.dart';
import 'package:productive_families/data/models/user_models/products/user_sub_category_product_model.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_cached_network_image.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../../../../business_logic/user/favorite_state/user_favorite_state_cubit.dart';
import '../shared/fav_bottom_sheet.dart';

class SubCategoryProductGridItem extends StatefulWidget {
  final Products productModel;

  const SubCategoryProductGridItem({Key? key, required this.productModel})
      : super(key: key);

  @override
  State<SubCategoryProductGridItem> createState() =>
      _SubCategoryProductGridItemState();
}

class _SubCategoryProductGridItemState
    extends State<SubCategoryProductGridItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, USER_ABOUT_PRODUCT,
            arguments: widget.productModel.id);
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
                    width: 48.w,
                    child: DefaultCachedNetworkImage(
                      imageUrl: widget.productModel.image.path,
                      fit: BoxFit.cover,
                    )),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BlocConsumer<UserFavoriteStateCubit,
                        UserFavoriteStateStates>(
                      listener: (context, state) {
                        if (state
                            is UserFavoriteGroupProductAddOrDeleteSuccessState) {
                          if (state.productId == widget.productModel.id) {
                            if (state.favoriteGroupCount > 0) {
                              setState(() {
                                widget.productModel.favorite = 1;
                              });
                            } else {
                              setState(() {
                                widget.productModel.favorite = 0;
                              });
                            }
                          }
                        }
                      },
                      builder: (context, state) {
                        return DefaultIconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: FavBottomSheet(
                                    productId: widget.productModel.id),
                              ),
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                            );
                          },
                          icon: widget.productModel.favorite == 0
                              ? const Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                          background: Colors.white,
                        );
                      },
                    ),
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
                              text: widget.productModel.name,
                              textStyle: Theme.of(context).textTheme.overline,
                              fontWeight: FontWeights.bold,
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: DefaultText(
                              textAlign: TextAlign.end,
                              color: goldTextAndStars,
                              text: widget.productModel.price.toString() +
                                  ' $AppCurrencyShortcut',
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
                              text: '(${widget.productModel.rateTimes} تقييم)',
                              textStyle: Theme.of(context).textTheme.overline,
                            ),
                          ),
                          Flexible(
                            flex: 0,
                            child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: RatingBarIndicator(
                                rating: widget.productModel.rate.toDouble(),
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
