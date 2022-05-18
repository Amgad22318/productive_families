import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:productive_families/constants/constants.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/models/user_models/search/user_product_search_model.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/shared/fav_bottom_sheet.dart';
import 'package:productive_families/presentation/widgets/default_cached_network_image.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../../../../business_logic/user/favorite_state/user_favorite_state_cubit.dart';

class ProductSearchGridItem extends StatefulWidget {
  final Products productModel;

  const ProductSearchGridItem({Key? key, required this.productModel})
      : super(key: key);

  @override
  State<ProductSearchGridItem> createState() => _ProductSearchGridItemState();
}

class _ProductSearchGridItemState extends State<ProductSearchGridItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, USER_ABOUT_PRODUCT);
        },
        child: LimitedBox(
        maxHeight: 22.h,
          maxWidth: 40.w,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 15.h,
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
                        imageUrl: widget.productModel.image.path.toString(),
                        fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BlocConsumer<UserFavoriteStateCubit,
                        UserFavoriteStateStates>(
                      listener: (context, state) {
                        if (state
                            is UserFavoriteGroupProductAddOrDeleteSuccessState) {
                          if (state.productId ==
                          widget.productModel.id) {
                            if (state.favoriteGroupCount > 0) {
                              setState(() {
                                widget.productModel.setFavourite = 1;
                              });
                            } else {
                              setState(() {
                                widget.productModel.setFavourite = 0;
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
                                child:
                                    FavBottomSheet(productId: widget.productModel.id),
                              ),
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                            );
                          },
                          icon:  Icon(
                            widget.productModel.favourite==0? Icons.favorite_border_outlined:Icons.favorite,
                            color:Colors.red,
                          ),
                          background: Colors.white,
                        );
                      },
                    ),
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        flex: 40,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 7,
                              child: DefaultText(
                                text: widget.productModel.name,
                                textStyle: Theme.of(context).textTheme.overline,
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: DefaultText(
                                textAlign: TextAlign.end,
                                color: goldTextAndStars,
                                text: '${widget.productModel.price.toString()} ' +
                                    AppCurrencyShortcut,
                                textStyle: Theme.of(context).textTheme.overline,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Flexible(
                        flex: 40,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: DefaultText(
                                text: widget.productModel.serviceName,
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
      ),
    );
  }
}
