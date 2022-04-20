import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/business_logic/user/sub_category_product/user_sub_category_product_cubit.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/router/arguments/user_arguments/sub_category_product_args.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/filtering/sub_category_product_grid_Item.dart';
import 'package:productive_families/presentation/widgets/default_error_widget.dart';
import 'package:productive_families/presentation/widgets/default_loading_indicator.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/favorite_button_with_number.dart';

import '../../../../data/models/user_models/products/user_sub_category_product_model.dart';

class SubCategoryProductScreen extends StatefulWidget {
  final SubCategoryProductArgs subCategoryProductArgs;

  const SubCategoryProductScreen({
    Key? key,
    required this.subCategoryProductArgs,
  }) : super(key: key);

  @override
  State<SubCategoryProductScreen> createState() =>
      _SubCategoryProductScreenState();
}

class _SubCategoryProductScreenState extends State<SubCategoryProductScreen> {
  late UserSubCategoryProductCubit userSubCategoryProductCubit;
  ScrollController? _scrollController;
  late bool isFabVisible;

  @override
  void initState() {
    isFabVisible = false;
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserSubCategoryProductCubit()
        ..getSubCategoryProduct(
            providerId: widget.subCategoryProductArgs.providerId,
            subCategoryId: widget.subCategoryProductArgs.subCategoryId),
      child: Builder(builder: (context) {
        userSubCategoryProductCubit = UserSubCategoryProductCubit.get(context);
        return Scaffold(floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: isFabVisible
              ? FloatingActionButton(child: const Icon(Icons.arrow_upward),
                  onPressed: () {
                    _scrollController?.animateTo(0,
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn);
                    setState(() {
                      isFabVisible=false;
                    });
                  },
                )
              : null,
          appBar: DefaultShopAppbar(
              centerTitle: true,
              title: DefaultText(
                textStyle: Theme.of(context).textTheme.headline5,
                text: widget.subCategoryProductArgs.subCategoryName,
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, USER_REVIEWS_SEARCH_SCREEN);
                    },
                    icon: const Icon(Icons.search)),
                const FavoriteButtonWithNumber(),
              ],
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios))),
          body: Column(
            children: [
              Image.asset(
                'assets/image/appbar_half_circle.png',
              ),
              Expanded(
                child: NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    if (notification.direction == ScrollDirection.reverse) {
                      if (!isFabVisible) {
                        setState(() {
                          isFabVisible=true;
                        });
                      }
                    } else if(notification.direction == ScrollDirection.forward) {
                      if (isFabVisible) {
                        setState(() {
                          isFabVisible=false;
                        
                        });
                      }
                    }
                    return true;
                  },
                  child:
                      CustomScrollView(controller: _scrollController, slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        CHOSEN_MARKET_PRICE_FILTERING_SCREEN);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/filter.svg'),
                                      DefaultText(
                                        text: 'تصفية',
                                        textStyle:
                                            Theme.of(context).textTheme.button,
                                        color: greyText,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, CHOSEN_MARKET_ORDERING_SCREEN);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset('assets/icons/sort.svg'),
                                      DefaultText(
                                        text: 'ترتيب',
                                        textStyle:
                                            Theme.of(context).textTheme.button,
                                        color: greyText,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    BlocBuilder<UserSubCategoryProductCubit,
                        UserSubCategoryProductStates>(
                      builder: (context, state) {
                        if (state is UserGetSubCategoryProductSuccessState) {
                          List<Products> productList =
                              userSubCategoryProductCubit
                                  .userSubCategoryProductModel!.products;
                          return SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) => SubCategoryProductGridItem(
                                  productModel: productList[index]),
                              childCount: productList.length,
                            ),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8,
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.87),
                          );
                        } else if (state
                            is UserGetSubCategoryProductLoadingState) {
                          return const SliverFillRemaining(
                              child: DefaultLoadingIndicator());
                        } else if (state
                            is UserGetSubCategoryProductNoDataState) {
                          return const SliverFillRemaining(
                              child: DefaultErrorWidget());
                        } else {
                          return const SliverFillRemaining(
                              child: DefaultErrorWidget());
                        }
                      },
                    )
                  ]),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
