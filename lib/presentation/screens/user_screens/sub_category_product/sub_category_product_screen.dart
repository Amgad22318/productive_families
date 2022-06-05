import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/business_logic/user/sub_category_product/user_sub_category_product_cubit.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/router/arguments/user_arguments/sub_category_product_args.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/filtering/sub_category_product_grid_Item.dart';
import 'package:productive_families/presentation/widgets/default_error_widget.dart';
import 'package:productive_families/presentation/widgets/default_loading_indicator.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/favorite_button_with_number.dart';
import 'package:sizer/sizer.dart';

import '../../../../data/models/shared_models/shared_classes/api_product.dart';
import '../../../../data/models/user_models/products/user_sub_category_product_model.dart';
import '../../../styles/custom_icons.dart';

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

class _SubCategoryProductScreenState extends State<SubCategoryProductScreen>
    with SingleTickerProviderStateMixin {
  late UserSubCategoryProductCubit userSubCategoryProductCubit;
  final ScrollController _scrollController = ScrollController();
  late bool fabSwitch;
  late final TabController tabController;
  late int itemCounter;
  late int tempItemCounter;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);

    tabController.index = 1;
    fabSwitch = false;
    itemCounter = 0;
    tempItemCounter = 0;
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UserSubCategoryProductCubit()
          ..getSubCategoryProduct(
              providerId: widget.subCategoryProductArgs.providerId,
              subCategoryId: widget.subCategoryProductArgs.subCategoryId),
        child: BlocBuilder<UserSubCategoryProductCubit,
            UserSubCategoryProductStates>(
          builder: (context, state) {
            userSubCategoryProductCubit =
                UserSubCategoryProductCubit.get(context);
            return Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.startFloat,
              floatingActionButton: userSubCategoryProductCubit
                      .userSubCategoryProductModel.products.isNotEmpty
                  ? FloatingActionButton(
                      child: fabSwitch
                          ? const Icon(Icons.arrow_upward)
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  DefaultText(text: itemCounter.toString()),
                                  const Divider(
                                    indent: 5,
                                    endIndent: 5,
                                    color: darkBlue,
                                    height: 2,
                                  ),
                                  DefaultText(
                                      text: userSubCategoryProductCubit
                                          .userSubCategoryProductModel
                                          .products
                                          .length
                                          .toString()),
                                ]),
                      onPressed: () {
                        if (fabSwitch == true) {
                          _scrollController.animateTo(0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn);
                        }
                        setState(() {
                          fabSwitch = false;
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
                          Navigator.pushNamed(
                              context, USER_REVIEWS_SEARCH_SCREEN);
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
                    child: NotificationListener(
                      onNotification: (notification) {
                        itemCounter =
                            (_scrollController.offset / 15.h).round() + 1;
                        if (itemCounter != tempItemCounter &&
                            itemCounter % 2 == 0) {
                          setState(() {
                            printTest(itemCounter.toString());
                            tempItemCounter = itemCounter;
                          });
                        }
                        return true;
                      },
                      child: NotificationListener<UserScrollNotification>(
                        onNotification: (notification) {
                          if (notification.direction ==
                              ScrollDirection.forward) {
                            if (!fabSwitch) {
                              setState(() {
                                fabSwitch = true;
                              });
                            }
                          } else if (notification.direction ==
                              ScrollDirection.reverse) {
                            if (fabSwitch) {
                              setState(() {
                                fabSwitch = false;
                              });
                            }
                          }
                          return true;
                        },
                        child: CustomScrollView(
                            controller: _scrollController,
                            slivers: [
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/filter.svg'),
                                                DefaultText(
                                                  text: 'تصفية',
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .button,
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
                                              Navigator.pushNamed(context,
                                                  CHOSEN_MARKET_ORDERING_SCREEN);
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/sort.svg'),
                                                DefaultText(
                                                  text: 'ترتيب',
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .button,
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
                                  if (state
                                      is UserGetSubCategoryProductSuccessState) {
                                    List<ApiProduct> productList =
                                        userSubCategoryProductCubit
                                            .userSubCategoryProductModel
                                            .products;
                                    return SliverGrid(
                                      delegate: SliverChildBuilderDelegate(
                                        (context, index) {
                                          return SubCategoryProductGridItem(
                                              productModel: productList[index]);
                                        },
                                        childCount: productList.length,
                                      ),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 8,
                                        crossAxisSpacing: 8,
                                        crossAxisCount: 2,
                                        mainAxisExtent: 30.h,
                                      ),
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
                  ),
                ],
              ),
              bottomNavigationBar: Material(
                color: darkBlue,
                child: TabBar(
                  controller: tabController,
                  onTap: (index) {
                    if (index == 0) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, SHOP_LAYOUT, (route) => false,
                          arguments: 0);
                    } else if (index == 1) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, SHOP_LAYOUT, (route) => false,
                          arguments: 1);
                    } else if (index == 2) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, SHOP_LAYOUT, (route) => false,
                          arguments: 2);
                    } else if (index == 3) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, SHOP_LAYOUT, (route) => false,
                          arguments: 3);
                    }
                  },
                  tabs: const [
                    Tab(icon: Icon(CustomIcons.home, size: 18)),
                    Tab(icon: Icon(CustomIcons.shop, size: 18)),
                    Tab(
                        icon: Icon(
                      CustomIcons.heart,
                      size: 18,
                    )),
                    Tab(icon: Icon(Icons.person)),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
