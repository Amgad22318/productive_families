import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/markets/market_section_item.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../../../business_logic/user/category/user_category_cubit.dart';
import '../../../../business_logic/user/category/user_category_state.dart';
import '../../../../business_logic/user/stores/user_all_and_single_category_stores_cubit.dart';
import '../../../../constants/constants.dart';
import '../../../../data/models/user_models/category/user_all_categories_model.dart';
import '../../../../data/models/user_models/shared_classes/single_and_all_categories_user_store.dart';
import '../../../views/screen_views/user_screen_views/markets/markets_grid_view_item.dart';
import '../../../widgets/default_error_widget.dart';
import '../../../widgets/default_loading_indicator.dart';

class StoresScreen extends StatefulWidget {
  const StoresScreen({Key? key}) : super(key: key);

  @override
  State<StoresScreen> createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  late UserCategoryCubit userCategoryCubit;
  late UserAllAndSingleCategoryStoresCubit categoryStoresCubit;

  @override
  Widget build(BuildContext context) {
    userCategoryCubit = UserCategoryCubit.get(context);
    categoryStoresCubit = UserAllAndSingleCategoryStoresCubit.get(context);
    categoryStoresCubit.changeSelectedCategoryIndex(
        index: SelectedCategoryFromHome);

    return Scaffold(
        appBar: DefaultShopAppbar(
          centerTitle: true,
          title: DefaultText(
            textStyle: Theme.of(context).textTheme.headline5,
            text: 'المتاجر',
          ),
        ),
        body: Column(
          children: [
            Image.asset(
              'assets/image/appbar_half_circle.png',
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
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
                                          MARKETS_PRICE_FILTERING_SCREEN);
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
                                      Navigator.pushNamed(
                                          context, MARKETS_ORDERING_SCREEN);
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
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 8.0),
                          child: DefaultText(
                            maxLines: 2,
                            text: 'الأقسام',
                            textStyle: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: BlocBuilder<UserCategoryCubit, UserCategoryStates>(
                      builder: (context, state) {
                        if (state is UserGetAllCategoriesSuccessState) {
                          List<Categories> categoriesList = userCategoryCubit
                              .userAllCategoriesModel!.categories;
                          return SizedBox(
                              height: 14.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: categoriesList.length + 1,
                                itemBuilder: (context, index) {
                                  if (index == 0) {
                                    return MarketSectionItem(
                                        index: index,
                                        categoryStoresCubit:
                                            categoryStoresCubit,
                                        category: categoriesList[index]);
                                  } else {
                                    return MarketSectionItem(
                                        index: index,
                                        categoryStoresCubit:
                                            categoryStoresCubit,
                                        category: categoriesList[index - 1]);
                                  }
                                },
                              ));
                        } else if (state is UserGetAllCategoriesLoadingState) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: DefaultLoadingIndicator(),
                          );
                        } else {
                          return const Center(child: DefaultErrorWidget());
                        }
                      },
                    ),
                  ),
                  BlocBuilder<UserAllAndSingleCategoryStoresCubit,
                      UserAllAndSingleCategoryStoresStates>(
                    builder: (context, state) {

                      if (state is UserGetAllCategoriesStoresSuccessState) {
                        List<SingleAndAllCategoriesUserStore> storesModel = categoryStoresCubit
                            .userAllCategoryStoresModel!.stores;
                        return SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => MarketsGridViewItems(
                                storesModel: storesModel[index]),
                            childCount: storesModel.length,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 4,
                                  crossAxisSpacing: 2,
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.1),
                        );
                      }
                      else if (state is UserGetSingleCategoriesStoresSuccessState) {
                        List<SingleAndAllCategoriesUserStore> storesModel = categoryStoresCubit
                            .userSingleCategoryStoresModel!.stores;
                        return SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => MarketsGridViewItems(
                                storesModel: storesModel[index]),
                            childCount: storesModel.length,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 4,
                                  crossAxisSpacing: 2,
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.1),
                        );
                      }

                      else if (state
                          is UserGetStoresLoadingState||state is UserChangeSelectedCategoryIndexState) {
                        return const SliverFillRemaining(
                          child: DefaultLoadingIndicator(),
                        );
                      } else if(state is UserGetAllCategoriesStoresErrorState ){
                        return const SliverFillRemaining(
                          child: DefaultErrorWidget(),
                        );
                      }
                      else{
                        return const SliverFillRemaining(
                          child: DefaultLoadingIndicator(),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
