import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/data/models/shared_models/shared_classes/image.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/markets/market_section_item.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../../../business_logic/user/category/user_category_cubit.dart';
import '../../../../business_logic/user/category/user_category_state.dart';
import '../../../../business_logic/user/stores/all_and_single_category_stores_cubit.dart';
import '../../../../data/models/user_models/category/user_all_categories_model.dart';
import '../../../views/screen_views/user_screen_views/markets/markets_grid_view_item.dart';
import '../../../widgets/default_error_widget.dart';
import '../../../widgets/default_loading_indicator.dart';

class Markets extends StatefulWidget {
  const Markets({Key? key}) : super(key: key);

  @override
  State<Markets> createState() => _MarketsState();
}

class _MarketsState extends State<Markets> {
  late UserCategoryCubit userCategoryCubit;
  late AllAndSingleCategoryStoresCubit categoryStoresCubit;

  @override
  Widget build(BuildContext context) {
    userCategoryCubit = UserCategoryCubit.get(context);
    categoryStoresCubit = AllAndSingleCategoryStoresCubit.get(context);


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
                        List<Categories> categoriesList =
                            userCategoryCubit.userAllCategoriesModel!.categories;
                        if (categoriesList[0].name != 'الكل') {
                          categoriesList.insert(
                              0,
                              Categories(
                                  name: 'الكل',
                                  categoryImage: ApiImage(type: '', path: '', id: 0),
                                  id: 0));
                        }
                        if (state is UserGetAllCategoriesSuccessState) {
                          return SizedBox(
                              height: 14.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: categoriesList.length,
                                itemBuilder: (context, index) {
                                  return MarketSectionItem(
                                      index: index,
                                      categoryStoresCubit: categoryStoresCubit,
                                      category: categoriesList[index]);
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
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => const MarketsGridViewItems(),
                      childCount: 20,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 2,
                            crossAxisCount: 2,
                            childAspectRatio: 1.1),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
