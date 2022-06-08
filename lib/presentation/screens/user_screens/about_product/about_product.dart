import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/business_logic/user/add_product_to_cart/user_add_product_to_cart_cubit.dart';
import 'package:productive_families/business_logic/user/favorite_state/user_favorite_state_cubit.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/constants.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/constants/enums.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/about_product/about_product_review_item.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/shared/fav_bottom_sheet.dart';
import 'package:productive_families/presentation/widgets/default_cached_network_image.dart';
import 'package:productive_families/presentation/widgets/default_error_widget.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_loading_indicator.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../business_logic/user/product_details/user_product_details_cubit.dart';
import '../../../../data/models/user_models/products/user_show_product_model.dart';

class AboutProduct extends StatefulWidget {
  final int productId;

  const AboutProduct({Key? key, required this.productId}) : super(key: key);

  @override
  State<AboutProduct> createState() => _AboutProductState();
}

class _AboutProductState extends State<AboutProduct> {
  late int fullProductCarouselSliderImagesActiveIndex;
  late bool fullProductDescription;
  late UserAddProductToCartCubit userAddProductToCartCubit;

  @override
  void initState() {
    fullProductDescription = false;
    fullProductCarouselSliderImagesActiveIndex = 0;
    super.initState();
  }

  late UserProductDetailsCubit userProductDetailsCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserProductDetailsCubit()
        ..getUserProductDetails(productId: widget.productId),
      child: Scaffold(
        appBar: DefaultShopAppbar(
          centerTitle: true,
          title: DefaultText(
            textStyle: Theme.of(context).textTheme.headline5,
            text: 'عن المنتج',
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
            )
          ],
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, BASKET_SCREEN);
              },
              icon: SvgPicture.asset(
                'assets/icons/shopping-cart-outline-badged.svg',
              )),
        ),
        body: Column(
          children: [
            Image.asset(
              'assets/image/appbar_half_circle.png',
            ),
            BlocBuilder<UserProductDetailsCubit, UserProductDetailsStates>(
              builder: (context, builderState) {
                if (builderState is UserGetProductDetailsSuccessState) {
                  userProductDetailsCubit =
                      UserProductDetailsCubit.get(context);
                  UserShowProductModel userShowProductModel =
                      userProductDetailsCubit.userShowProductModel;
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Stack(
                              alignment: AlignmentDirectional.topStart,
                              children: [
                                CarouselSlider(
                                    items: List.generate(
                                        userShowProductModel
                                            .product.images.length,
                                        (index) => Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.sp),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                                clipBehavior: Clip.antiAlias,
                                                child:
                                                    DefaultCachedNetworkImage(
                                                        imageUrl:
                                                            userShowProductModel
                                                                .product
                                                                .images[index]
                                                                .path,
                                                        fit: BoxFit.cover),
                                              ),
                                            )),
                                    options: CarouselOptions(
                                        enlargeCenterPage: true,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            fullProductCarouselSliderImagesActiveIndex =
                                                index;
                                          });
                                        },
                                        autoPlay: false,
                                        height: 180,
                                        initialPage: 0,
                                        autoPlayInterval:
                                            const Duration(seconds: 3),
                                        autoPlayAnimationDuration:
                                            const Duration(milliseconds: 1500),
                                        viewportFraction: 1,
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        scrollDirection: Axis.horizontal)),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      top: 8.0, start: 16),
                                  child: BlocConsumer<UserFavoriteStateCubit,
                                      UserFavoriteStateStates>(
                                    listener: (context, state) {
                                      if (state
                                          is UserFavoriteGroupProductAddOrDeleteSuccessState) {
                                        if (state.productId ==
                                            userShowProductModel.product.id) {
                                          if (state.favoriteGroupCount > 0) {
                                            setState(() {
                                              userShowProductModel
                                                  .product.setFavorite = 1;
                                            });
                                          } else {
                                            setState(() {
                                              userShowProductModel
                                                  .product.setFavorite = 0;
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
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: FavBottomSheet(
                                                  productId:
                                                      userShowProductModel
                                                          .product.id),
                                            ),
                                            backgroundColor: Colors.transparent,
                                            isScrollControlled: true,
                                          );
                                        },
                                        icon: Icon(
                                          userShowProductModel
                                                      .product.favorite ==
                                                  0
                                              ? Icons.favorite_border_outlined
                                              : Icons.favorite,
                                          color: Colors.red,
                                        ),
                                        background: Colors.white,
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: AnimatedSmoothIndicator(
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.fastLinearToSlowEaseIn,
                              count: userShowProductModel.product.images.length,
                              // backend must put limit
                              activeIndex:
                                  fullProductCarouselSliderImagesActiveIndex,
                              effect: const CustomizableEffect(
                                  activeDotDecoration: DotDecoration(
                                    color: defaultYellow,
                                    height: 5,
                                    width: 10,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                  ),
                                  dotDecoration: DotDecoration(
                                      dotBorder: DotBorder(
                                        width: 1,
                                        color: Colors.grey,
                                      ),
                                      height: 10,
                                      width: 10,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(3)))),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DefaultText(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                  text: userShowProductModel.product.name,
                                ),
                                DefaultText(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyText2,
                                  text: userShowProductModel.product.price
                                          .toString() +
                                      ' $AppCurrencyShortcut',
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    RatingBarIndicator(
                                      rating: userShowProductModel.product.rate
                                          .toDouble(),
                                      itemBuilder: (context, index) =>
                                          const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 24.0,
                                      direction: Axis.horizontal,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    DefaultText(
                                      color: Colors.grey,
                                      text:
                                          '(${userShowProductModel.product.rateTimes} تقييم)',
                                      textStyle:
                                          Theme.of(context).textTheme.overline,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  padding: const EdgeInsetsDirectional.all(8),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: productDescriptionBackGround,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          DefaultText(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                            text: 'وصف المنتج',
                                          ),
                                          const Spacer(),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  fullProductDescription =
                                                      !fullProductDescription;
                                                });
                                              },
                                              icon: SvgPicture.asset(
                                                'assets/icons/product_description_down_arrow.svg',
                                                color: darkBlue,
                                              ))
                                        ],
                                      ),
                                      Text(
                                        userShowProductModel
                                            .product.description,
                                        maxLines:
                                            fullProductDescription ? null : 1,
                                        overflow: fullProductDescription
                                            ? null
                                            : TextOverflow.ellipsis,
                                        style:
                                            Theme.of(context).textTheme.caption,
                                      )
                                    ],
                                  ),
                                ),
                                if (userShowProductModel
                                    .product.rates.isNotEmpty)
                                  DefaultText(
                                    textStyle:
                                        Theme.of(context).textTheme.subtitle1,
                                    text: 'تقييمات المنتج',
                                  ),
                                ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: userShowProductModel
                                        .product.rates.length,
                                    itemBuilder: (context, index) =>
                                        AboutProductReviewItem(
                                            reviewModel: userShowProductModel
                                                .product.rates[index])),
                                if (userShowProductModel
                                    .product.rates.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 100.0, vertical: 16),
                                    child: DefaultMaterialButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context,
                                            USER_PRODUCT_ALL_REVIEWS_SCREEN,
                                            arguments: userShowProductModel
                                                .product.id);
                                      },
                                      height: 50,
                                      text: 'كل التقييمات',
                                    ),
                                  ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 8),
                                  child: BlocProvider(
                                    create: (context) =>
                                        UserAddProductToCartCubit(),
                                    child: Builder(builder: (context) {
                                      userAddProductToCartCubit =
                                          UserAddProductToCartCubit.get(
                                              context);
                                      return BlocListener<
                                          UserAddProductToCartCubit,
                                          UserAddProductToCartStates>(
                                        listener: (context, state) {
                                          if (state
                                              is UserAddProductToCartSuccessState) {
                                            showToastMsg(
                                                msg: state.message,
                                                toastState:
                                                    ToastStates.SUCCESS);
                                            Navigator.pushNamed(
                                                context, BASKET_SCREEN);
                                          } else if (state
                                              is UserAddProductToCartWrongProviderState) {
                                            showToastMsg(
                                                msg: state.message,
                                                toastState: ToastStates.ERROR);
                                          }
                                        },
                                        child: DefaultMaterialButton(
                                          onPressed: () {
                                            userAddProductToCartCubit
                                                .userAddProductToCart(
                                                    productId:
                                                        widget.productId);
                                          },
                                          fontSize: 20,
                                          height: 50,
                                          text: 'اضافة للسلة',
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (builderState is UserGetProductDetailsLoadingState) {
                  return const Expanded(child: DefaultLoadingIndicator());
                } else {
                  return const Expanded(child: DefaultErrorWidget());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
